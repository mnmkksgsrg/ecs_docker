resource "aws_security_group" "lb" {
  description = "Security Group for ALB"
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "my_lb_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  description = "Allow HTTP traffic from the internet"
  security_group_id = aws_security_group.lb.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  description = "Allow HTTPS traffic from the internet"
  security_group_id = aws_security_group.lb.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "alb_ipv4" {
  description = "Allow IPv4 Address to the internet"
  security_group_id = aws_security_group.lb.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "alb_ipv6" {
  description = "Allow IPv6 Address to the internet"
  security_group_id = aws_security_group.lb.id
  ip_protocol       = "-1"
  cidr_ipv6         = "::/0"
}

resource "aws_security_group" "ecs" {
  description = "Security Group for ECS"
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "my_ecs_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecs_http" {
  description = "Allow HTTP traffic from the ALB"
  security_group_id            = aws_security_group.ecs.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.lb.id
}

resource "aws_vpc_security_group_egress_rule" "ecs_ipv4" {
  description = "Allow IPv4 Address to the ALB"
  security_group_id = aws_security_group.ecs.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "ecs_ipv6" {
  description = "Allow IPv6 Address to the ALB"
  security_group_id = aws_security_group.ecs.id
  ip_protocol       = "-1"
  cidr_ipv6         = "::/0"
}


