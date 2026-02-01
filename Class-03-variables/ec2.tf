resource "aws_instance" "webserver01" {
  ami               =  var.ami
  instance_type     = var.instancetype
  key_name          = "skoda-keypair"
  security_groups   = ["skoda-sg"]
  availability_zone = "us-west-2b"

  tags = {
    Name = var.tag
    Env  = "dev"
  }
}
