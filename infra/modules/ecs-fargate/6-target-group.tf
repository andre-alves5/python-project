resource "aws_lb_target_group" "tg" {
  name        = "${var.env}-tg"
  port        = var.container-port
  protocol    = "HTTP"
  vpc_id      = var.vpc-id
  target_type = "ip"

  health_check {
    path                = "/health"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.env}-ecs-target-group"
  }
}
