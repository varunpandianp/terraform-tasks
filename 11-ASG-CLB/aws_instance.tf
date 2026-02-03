resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt-"
  image_id      = var.webservers_ami
  instance_type = var.instance_type
  key_name      = var.KeyName

  vpc_security_group_ids = [aws_security_group.webservers.id]
  user_data              = base64encode(file("install_httpd.sh"))

}


