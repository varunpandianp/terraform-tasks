data "aws_ami" "ami-test1" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = var.value
  }
}

resource "aws_instance" "instance_from_data_block" {
  ami           = data.aws_ami.ami-test1.id
  instance_type = var.machinetype
  key_name      = "skoda-keypair"

  tags = {
    Name = "HelloWorld"
  }
}



