resource "aws_security_group" "alb_sg" {

  name        = var.alb_security_group_name
  description = "Managed by Terraform"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.alb_security_group_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}

resource "aws_lb" "alb" {

  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.alb_sg.id]
  subnets         = var.subnet_ids

  tags = {
    Name        = var.alb_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}

resource "aws_lb_target_group" "alb_target_group" {

  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled  = true
    path     = "/"
    port     = "traffic-port"
    protocol = "HTTP"
  }

  tags = {
    Name        = var.target_group_name
    environment = "production"
    created_by  = "terraform"
    owner       = "Nandan"
  }
}

resource "aws_lb_target_group_attachment" "alb_target_group_attachment" {

  count = length(var.instance_ids)

  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.instance_ids[count.index]
  port             = 80
}

resource "aws_lb_listener" "alb_listener" {

  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}