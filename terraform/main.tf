resource "aws_ecs_cluster" "gbfs_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "gbfs_task" {
  family                   = "gbfs-dashboard"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.gbfs_ecs_task_role.arn
  task_role_arn            = aws_iam_role.gbfs_ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "gbfs-container"
      image     = "var.docker_image"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "gbfs_service" {
  name            = var.ecs_service
  cluster         = aws_ecs_cluster.gbfs_cluster.id
  desired_count   = 1
  task_definition = aws_ecs_task_definition.gbfs_task.arn
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = ["subnet-08c60bd663524d6f3", "subnet-0508c5ec1774d7e41"]
    security_groups = [aws_security_group.my_sg.id]
  }
}
