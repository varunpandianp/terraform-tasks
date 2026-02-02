
resource "aws_volume_attachment" "attach_volume" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.Volume2gb.id
  instance_id = aws_instance.webserver01.id
}
