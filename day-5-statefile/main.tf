provider "aws" {
  
}
resource "aws_s3_bucket" "name" {
    bucket="state-bucket-store-anusha"
}
resource "aws_s3_bucket_versioning" "example" {
    bucket = aws_s3_bucket.name.id
    versioning_configuration {
      status = "Enabled"
    }
}
resource "aws_dynamodb_table" "dynamo-terraform-state-lock" {
  name="terraform-state-lock-dynamo-anusha"
  hash_key = "LockID"
  read_capacity =20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}