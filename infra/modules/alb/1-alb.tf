# checkov:skip=CKV_AWS_152: "Cross-zone load balancing is enabled by default for ALBs and cannot be disabled."
resource "aws_lb" "this" {
  name               = "${var.env}-${var.project}-alb"
  internal           = var.internal
  load_balancer_type = var.lb-type
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public-subnet-ids

  enable_deletion_protection = var.enable-deletion-protection
  drop_invalid_header_fields = true

  access_logs {
    bucket  = var.log_bucket_name
    prefix  = "${var.project}-alb"
    enabled = true
  }

  tags = {
    Name = "${var.env}-${var.project}-alb"
  }
}

resource "aws_security_group" "alb_sg" {
  name   = "${var.env}-${var.project}-alb-sg"
  vpc_id = var.vpc-id

  # checkov:skip=CKV_AWS_260: "Ingress on port 80 is required for the HTTP to HTTPS redirect."
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
