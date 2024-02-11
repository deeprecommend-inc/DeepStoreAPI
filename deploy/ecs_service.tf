resource "aws_ecs_service" "service" {
  name            = "deep-store-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets = ["subnet-abcde012", "subnet-bcde012a"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.deep_store.arn
    container_name   = "deep-store"
    container_port   = 80
  }
}