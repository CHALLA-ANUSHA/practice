module "first-module" {
  source = "../day-9-modules"
  ami_id="ami-0cc9838aa7ab1dce7"
  instance_type="t2.micro"
  keyname = "keypairaws"
}