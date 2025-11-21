resource "aws_iam_role" "task_execution" {
  name = "${var.env}-${var.project}-task-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "ecs-tasks.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "task_exec_attach" {
  role       = aws_iam_role.task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "task_role" {
  name = "${var.env}-${var.project}-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "ecs-tasks.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "task_secrets_policy" {
  name = "${var.env}-${var.project}-task-secrets-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid    = "AllowGetSecrets"
      Effect = "Allow"
      Action = [
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret"
      ]
      Resource = "*"
      }, {
      Sid    = "DenyAllOutsideTraffic"
      Effect = "Deny"
      NotAction = [
        "s3:GetObject",
        "dynamodb:GetItem",
        "kms:Decrypt"
      ]
      "Resource" : "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "task_policy_attach" {
  role       = aws_iam_role.task_role.name
  policy_arn = aws_iam_policy.task_secrets_policy.arn
}
