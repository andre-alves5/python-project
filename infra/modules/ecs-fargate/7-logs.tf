resource "aws_cloudwatch_log_group" "ecs_app" {
  name              = "/ecs/${var.env}-eloquent-api-svc"
  retention_in_days = 7

  tags = {
    Name = "${var.env}-app-logs"
  }
}

resource "aws_cloudwatch_log_group" "ecs_firelens" {
  name              = "/ecs/${var.env}-eloquent-api-svc-firelens"
  retention_in_days = 7
}
