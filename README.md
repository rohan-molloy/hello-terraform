# Hello Terraform - EC2 & Route53
Basic Terraform example to create an EC2 Instance and assign its IP address to a Route53 DNS Record
This example uses user-data to set up a simple web server on the instance. This example also demonstrates the use
of the local-exec provisioner

## Usage

1. Set up your tfvars file
Your tfvars file is used to set variables that are unique to this deployment or to override the default values defined in variables.tf

```
route53_name    = "hello-terraform.aws.example.com"
route53_zone_id = "Z123456789ABCDEF"
```

2. Export your AWS crdentials
Warning: These may be logged in your command history! 

```
$env:AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXXXXXXX"
$env:AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

3. Initialize Terraform provider

```
$ terraform init
```

4. Plan your deployment

```
$ terraform plan -var-file="example.tfvars"
```

4. Create your deployment

```
$ terraform apply -var-file="example.tfvars"
```

5. Destroy your deployment 

```
$ terraform destroy -var-file="example.tfvars"
```

## Further expansion 
This is meant to be a basic introduction to using Terraform
Other things I'd like to try

- Generating the DNS record name dynamically (perhaps from the instance id)
- Using S3 as a [remote state backend](https://www.terraform.io/docs/backends/types/s3.html)