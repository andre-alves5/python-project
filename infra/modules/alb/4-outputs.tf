output "alb-dns" {
  description = "ALB dns name"
  value       = aws_lb.this.dns_name
}

output "alb-arn" {
  value = aws_lb.this.arn
}

output "alb-sg-id" {
  value = aws_security_group.alb_sg.id
}
