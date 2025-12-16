resource "aws_lb" "alb" {
  load_balancer_type = "application"
  internal           = false
  ip_address_type    = "ipv4"
  subnets            = values(aws_subnet.public)[*].id
  security_groups    = [aws_security_group.lb.id]

  tags = {
    Name = "my_lb"
  }
}

resource "aws_lb_target_group" "this" {
  target_type      = "ip"
  protocol         = "HTTP"
  port             = 80
  vpc_id           = aws_vpc.this.id
  protocol_version = "HTTP1"

  health_check {
    protocol = "HTTP"
    path     = "/health"
  }

  tags = {
    Name = "my_lb_target_group"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

