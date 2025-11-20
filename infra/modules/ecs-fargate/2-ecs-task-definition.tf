resource "aws_ecs_task_definition" "this" {
  family                   = "${var.env}-task-definition"
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = var.network-mode
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.task_execution.arn
  task_role_arn            = aws_iam_role.task_role.arn
  container_definitions    = file("./taskdef.json")
}
