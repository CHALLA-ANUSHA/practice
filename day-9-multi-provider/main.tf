provider "aws" {
  region = "ap-south-1"
}
provider "aws" {
  region = "us-east-1"
  alias = "test"
}
resource "aws_s3_bucket" "name" {
   bucket = "mango1-bucket"
   provider = aws.test
}
resource "aws_s3_bucket" "anu" {
    bucket = "mango2-bucket"
  
}
