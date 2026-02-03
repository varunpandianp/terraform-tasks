resource "aws_autoscaling_group" "web_asg" {
  min_size         = 1
  max_size         = 4
  desired_capacity = 2

  vpc_zone_identifier = aws_subnet.public.*.id

  launch_template {
    name    = "lt-0c5dd0c01bf2240e5"
    version = "$Latest"
  }

  load_balancers = [aws_elb.terra-elb.name]

  health_check_type         = "ELB"
  health_check_grace_period = 300
}

