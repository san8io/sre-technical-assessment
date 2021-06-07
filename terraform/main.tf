terraform {
  backend "s3" {
    bucket         = "santechx-tf-backend"
    key            = "terraform"
    region         = "us-east-2"
#    dynamodb_table = "santechx-tf-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-2"
}

resource "aws_instance" "app" {
  ami           = "ami-0d563aeddd4be7fff"
  instance_type = "${var.instance_type}"

  tags = {
    Name        = "${var.instance_name}"
    Environment = "Dev"
  }
}


