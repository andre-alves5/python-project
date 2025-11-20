output "cluster-id" {
  value = aws_ecs_cluster.this.id
}

output "service-name" {
  description = "ECS service name"
  value       = aws_ecs_service.service.name
}

output "task-definition-arn" {
  value = aws_ecs_task_definition.this.arn
}

output "target-group-arn" {
  value = aws_lb_target_group.tg.arn
}
