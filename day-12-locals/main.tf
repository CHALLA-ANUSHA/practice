locals {
  bucket-name="${var.local}-${var.env}-bucket-anusha"
}
resource "aws_s3_bucket" "name" {
    bucket=local.bucket-name
    tags = {
      Name=local.bucket-name
      Environment = var.env
    }
  
}