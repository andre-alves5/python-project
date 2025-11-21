variable "env" {
  description = "Environment name."
  type        = string
}

variable "internal" {
  type = bool
}

variable "lb-type" {
  type = string
}

variable "enable-deletion-protection" {
  type = bool
}

variable "vpc-id" {
  type = string
}

variable "public-subnet-ids" {
  type = list(string)
}

variable "target-group-arn" {
  type = string
}

variable "project" {
  description = "The name of the project, used for resource naming."
  type        = string
}

variable "ssl_policy" {
  description = "The name of the SSL security policy for the HTTPS listener."
  type        = string
  default     = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
}

variable "log_bucket_name" {
  type = string
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate to attach to the ALB."
  type        = string
}
