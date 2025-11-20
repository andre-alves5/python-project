variable "env" {
  type = string
}

variable "vpc-cidr-block" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "private-subnets" {
  type = list(string)
}

variable "public-subnets" {
  type = list(string)
}
