terraform {
  required_version = "~> 1.0.1"
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
     }
    }
}
provider "aws" {
    profile = "default"    
    region = "us-east-1"
}
resource "aws_instance" "Vidinfra" {
    ami = "ami-04902260ca3d33422"
    instance_type = "t2.micro"
    count = 3
    tags = {
    Name = "vidhya-${count.index}"
  }
    key_name="aws_class"
}
resource "aws_s3_bucket" "big-basket" {
	bucket = "my-big-basket-vidhya"
}