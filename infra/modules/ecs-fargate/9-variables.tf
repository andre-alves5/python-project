variable "env" {
  type = string
}

variable "capacity-providers" {
  type    = list(string)
  default = ["FARGATE", "FARGATE_SPOT"]
}

variable "cpu" {
  type = number
}

variable "memory" {
  type = number
}

variable "network-mode" {
  type    = string
  default = "awsvpc"
}

variable "max-capacity" {
  type = number
}

variable "min-capacity" {
  type = number
}

variable "target-cpu-utilization" {
  type = number
}

variable "desired-count" {
  type = number
}

variable "container-port" {
  type = number
}

variable "launch-type" {
  type = string
}

variable "vpc-id" {
  type = string
}

variable "private-subnet-ids" {
  type = list(string)
}

variable "alb-sg-id" {
  type = string
}

variable "project" {
  description = "The name of the project, used for resource naming."
  type        = string
}

variable "use_fargate_spot" {
  description = "Whether to use Fargate Spot for the ECS service."
  type        = bool
  default     = false
}
