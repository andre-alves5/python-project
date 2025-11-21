variable "env" {
  description = "The target environment name (e.g., 'dev', 'staging', 'prod')."
  type        = string
}

variable "project" {
  description = "The name of the project, used for resource naming."
  type        = string
}

variable "repository_name" {
  description = "The name for the ECR repository."
  type        = string
}
