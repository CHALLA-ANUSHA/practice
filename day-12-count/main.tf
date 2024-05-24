resource "aws_instance" "name" {
    ami=var.ami_id
    instance_type = var.instance_type
    key_name = var.key-name
    count=length(var.sandboxes)
    tags={
        Name=var.sandboxes[count.index]
    }
  
}