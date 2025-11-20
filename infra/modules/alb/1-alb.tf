resource "aws_lb" "this" {
  name               = "${var.env}-alb"
  internal           = var.internal
  load_balancer_type = var.lb-type
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public-subnet-ids

  enable_deletion_protection = var.enable-deletion-protection

  tags = {
    Name = "${var.env}-alb"
  }
}

resource "aws_security_group" "alb_sg" {
  name   = "${var.env}-alb-sg"
  vpc_id = var.vpc-id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
