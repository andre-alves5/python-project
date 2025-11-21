resource "aws_security_group" "vpc_endpoints" {
  name   = "${var.env}-${var.project}-vpc-endpoints-sg"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc-cidr-block] # Allow traffic from within the VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound
  }

  tags = {
    Name = "${var.env}-${var.project}-vpc-endpoints-sg"
  }
}
