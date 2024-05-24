#create a vpc
resource "aws_vpc" "anusha" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="terraform-vpc"
    }
  
}

#create a subnet
resource "aws_subnet" "anusha" {
    vpc_id = aws_vpc.anusha.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name="terraform-subnet"
    }
}

#create ig and attach to vpc
resource "aws_internet_gateway" "anusha" {
    vpc_id = aws_vpc.anusha.id
    tags = {
      Name="terraform-ig"
    }
}

#create route table and edit route attach to ig
resource "aws_route_table" "anusha" {
    vpc_id = aws_vpc.anusha.id
    tags = {
      Name="terraform-rt"
    }
}
#edit route table attach to ig
resource "aws_route" "anusha" {
  route_table_id            = aws_route_table.anusha.id
  destination_cidr_block    = "0.0.0.0/0"  # Route all traffic
  gateway_id                = aws_internet_gateway.anusha.id
}



#subnet association to add into route table
resource "aws_route_table_association" "anusha" {
      subnet_id = aws_subnet.anusha.id
      route_table_id = aws_route_table.anusha.id
      
  
}
#create a security groups
resource "aws_security_group" "anusha" {


  vpc_id      = aws_vpc.anusha.id

  tags = {
    Name = "anusha_security_group"
  }
}

resource "aws_security_group_rule" "ingress_rule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.anusha.id
}

resource "aws_security_group_rule" "egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.anusha.id
}
resource "aws_instance" "name" {
  ami                    = "ami-0cc9838aa7ab1dce7"  # Ensure this is a valid AMI ID in your region
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.anusha.id
  key_name               = "keypairaws"  # Ensure this key pair exists in your region
  vpc_security_group_ids = [aws_security_group.anusha.id]

  tags = {
    Name = "anusha-terraform"
  }
}