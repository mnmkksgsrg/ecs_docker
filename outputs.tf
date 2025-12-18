output "alb_dns_name" {
  value = "http://${aws_lb.alb.dns_name}"
}

output "ecr_repository_url" {
  value = aws_ecr_repository.this.repository_url
}

output "eip" {
  value = aws_eip.nat.public_ip
}

