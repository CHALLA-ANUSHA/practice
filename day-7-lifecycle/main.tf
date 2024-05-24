provider "aws" {
  
}
resource "aws_instance" "name" {
  ami="ami-0cc9838aa7ab1dce7"
  instance_type="t2.micro"
   key_name = "keypairaws"
   tags = {
     Name="anusha"
   }

lifecycle {
    create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
  }
}