#create a vpc
resource "aws_vpc" "anusha" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="terraform-vpc"
    }
  
}

#create a subnet
resource "aws_subnet" "anusha"{
    vpc_id = aws_vpc.anusha.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name="terraform-subnet"
    }
}