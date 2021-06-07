provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-2"
}

resource "aws_s3_bucket" "b" {
  bucket = "santechx-tf-backend"
  force_destroy = true
}
