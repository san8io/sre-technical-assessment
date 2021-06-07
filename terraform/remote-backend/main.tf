provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_s3_bucket" "b" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_dynamodb_table" "tb" {
  name           = var.db_table_name
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
