variable "access_key" {
  default = "ACCESS_KEY_HERE"
}

variable "secret_key" {
  default = "SECRET_KEY_HERE"
}

variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "snet_cidr" {
  default = "10.1.0.0/24"
}

variable "availability_zone" {
  default = "us-east-2a"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ami_id" {
  default = "ami-0d563aeddd4be7fff"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "environment" {
  default = "Dev"
}

variable "instance_name" {
  default = "DefaultAppName"
}


