provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Environment" = "${var.environment}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Environment" = "${var.environment}"
  }
}

resource "aws_subnet" "public_snet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.snet_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone
  tags = {
    "Environment" = "${var.environment}"
  }
}

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Environment" = "${var.environment}"
  }
}

resource "aws_route_table_association" "rta_public_snet" {
  subnet_id      = aws_subnet.public_snet.id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_security_group" "sg_22" {
  name   = "sg_22"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Environment" = "${var.environment}"
  }
}

resource "aws_key_pair" "ec2key" {
  key_name   = "publicKey"
  public_key = file(var.public_key_path)
}


resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_snet.id
  vpc_security_group_ids = ["${aws_security_group.sg_22.id}"]
  tags = {
    Name        = "${var.instance_name}"
    Environment = "${var.environment}"
  }
}
