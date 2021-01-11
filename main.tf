provider "aws" {
    region = var.aws_region
}
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "example" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data = <<-EOF
  #!/bin/bash
  echo "Hello, World" > index.html
  nohup busybox httpd -f -p "${var.server_port}" &
  EOF
  tags = {
    Name = "terraform-example"
  }
  provisioner "local-exec" {
    command = "Test-NetConnection -ComputerName ${aws_instance.example.public_ip} -Port ${var.server_port}"
    interpreter = ["PowerShell", "-Command"]
  }
}
output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the web server"
}
resource "aws_route53_record" "example" {
  zone_id = var.route53_zone_id
  name    = var.route53_name
  type    = "A"
  ttl     = var.route53_ttl
  records = [aws_instance.example.public_ip]
}