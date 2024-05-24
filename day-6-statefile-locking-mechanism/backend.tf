terraform {
  backend "s3" {
    bucket="state-bucket-store-anusha"
    key="terraform.tfstate"
    region="ap-south-1"
    dynamodb_table = "terraform-state-lock-dynamo-anusha"
    encrypt = true
    
  }
}