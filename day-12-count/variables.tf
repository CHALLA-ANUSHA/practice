variable "ami_id" {
  description = "we will give the value of ami"
  type=string
  default = "value"
}
variable "instance_type" {
    description = "we will give the instance type"
    type=string
    default = "value"
  
}
variable "key-name" {
    type = string
    default = "value"
  
}
variable "sandboxes" {
  type=list(string)
  default = [ "anusha","ec2","instance" ]
}