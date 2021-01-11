
variable "aws_region" {
  description = "AWS Region to use for all resources"
  type        = string
  default     = "us-east-2"
}
variable "ec2_instance_type" {
  description = "The size of the AWS EC2 Instance"
  type        = string
  default     = "t2.micro"
}
variable "ec2_ami" {
  description = "The AMI image of the AWS EC2 Instance"
  type        = string 
  default     = "ami-0c55b159cbfafe1f0"
}
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}
variable "route53_zone_id" {
  description = "The Route53 zone hosting the DNS record"
  type        = string
}
variable "route53_ttl" {
  description = "The time to live for the DNS record"
  type        = number
  default     = 10
}
variable "route53_name" {
  description = "The fully qualified domain name for the DNS record"
  type        = string
}