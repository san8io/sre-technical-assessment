provider "aws" {
  access_key = "AKIAQVO5CA2KKCM3UHVB"
  secret_key = "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"
  region     = "us-east-2"
}

resource "aws_s3_bucket" "b" {
  bucket = "santechx-tf-backend"
  force_destroy = true
}
