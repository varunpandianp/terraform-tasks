resource "aws_instance" "webserver01" {
  ami = "ami-0e2ba60a049853bb4"
  instance_type = "t3.micro"
  key_name = "skoda-keypair"
  security_groups = ["skoda-sg"]
  tags = {
    Name = "Web Skoda"
    Env = "dev"
  }
}
