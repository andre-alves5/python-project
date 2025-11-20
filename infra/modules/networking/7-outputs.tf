output "vpc-id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "private-subnet-ids" {
  description = "Private subnet ids"
  value       = aws_subnet.private[*].id
}

output "public-subnet-ids" {
  description = "Public subnet ids"
  value       = aws_subnet.public[*].id
}
