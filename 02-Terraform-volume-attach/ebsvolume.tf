resource "aws_ebs_volume" "Volume2gb" {
  availability_zone = "us-west-2b"
  size              = 2
  type = "gp3"

  tags = {
    Name = "2gb-volume-attached"
  }
}