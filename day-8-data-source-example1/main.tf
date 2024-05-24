provider "aws" {
  
}
data "aws_subnet" "name" {
    filter {
      name="tag:Name"
      values = ["terraform-subnet"]
    }
  
}
resource "aws_instance" "based-on" {
  ami="ami-0cc9838aa7ab1dce7"
  instance_type="t2.micro"   
  key_name = "keypairaws"
  subnet_id = data.aws_subnet.name.id
  tags = {
    Name="datasource"
  }
}