resource "aws_ecs_task_definition" "task" {
  family                = "deep-store-family"
  network_mode          = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                   = "256"
  memory                = "512"
  container_definitions = <<DEFINITION
  [
    {
      "name": "deep-store",
      "image": "nginx:latest",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ]
    }
  ]
  DEFINITION
}