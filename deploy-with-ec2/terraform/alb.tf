resource "aws_lb" "cnc_alb" {
  name               = "cnc-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.cnc_ec2_sg.id]
  subnets            = aws_subnet.cnc_vpc_public_subnets[*].id

  tags = {
    Name = "cnc_alb"
  }
}

resource "aws_security_group" "cnc_alb_sg" {
  name        = "cncALBSecurityGroup"
  description = "Security group for cnc ALB"
  vpc_id      = aws_vpc.cnc_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_target_group" "cnc_alb_web_tg" {
  name     = "CNCWebALBTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.cnc_vpc.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "cnc_alb_http_listner" {
  load_balancer_arn = aws_lb.cnc_alb.arn
  protocol          = "HTTP"
  port              = "80"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cnc_alb_web_tg.arn
  }

}
resource "aws_lb_target_group_attachment" "cnc_web_tg_attachment" {
  count            = length(aws_instance.cnc_instance)
  target_group_arn = aws_lb_target_group.cnc_alb_web_tg.arn
  target_id        = aws_instance.cnc_instance[count.index].id
  port             = 80
}
