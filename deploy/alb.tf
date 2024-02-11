resource "aws_lb" "alb" {
  name               = "deep-store-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = ["subnet-abcde012", "subnet-bcde012a"]

  enable_deletion_protection = true

  tags = {
    Name = "deep-store-alb"
  }
}