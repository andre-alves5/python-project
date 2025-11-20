variable "env" {
  description = "Environment name."
  type        = string
}

variable "vpc-cidr-block" {
  description = "CIDR (Classless Inter-Domain Routing)."
  type        = string
  default     = "10.0.0.0/16"
}

variable "private-subnets" {
  description = "CIDR ranges for Private subnets."
  type        = list(string)
}

variable "public-subnets" {
  description = "CIDR ranges for Public subnets."
  type        = list(string)
}

variable "azs" {
  description = "Availability zones for subnets."
  type        = list(string)
}
