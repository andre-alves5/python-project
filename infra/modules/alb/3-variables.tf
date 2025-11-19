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

variable "certificate_arn" {
  type = string
}

variable "vpc-id" {
  type = string
}

variable "public-subnet-ids" {
  type = list(string)
}

variable "target-group" {
  type = string
}
