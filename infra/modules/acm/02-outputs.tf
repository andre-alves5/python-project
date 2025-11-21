output "certificate_arn" {
  description = "The ARN of the ACM certificate."
  value       = aws_acm_certificate.this.arn
}

output "dns_validation_record_name" {
  description = "The name of the CNAME record to create in your DNS provider to validate the certificate."
  value       = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_name
}

output "dns_validation_record_value" {
  description = "The value of the CNAME record to create in your DNS provider to validate the certificate."
  value       = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_value
}
