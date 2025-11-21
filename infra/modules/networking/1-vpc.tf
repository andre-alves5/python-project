resource "aws_vpc" "this" {
  cidr_block = var.vpc-cidr-block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-${var.project}-vpc"
  }
}

resource "aws_default_security_group" "vpc_sg" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.env}-${var.project}-default-sg"
  }
}
