variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the ALB"
}

variable "instance_ids" {
  type        = list(string)
  description = "EC2 instances to register with the target group"
}

variable "alb_name" {
  type        = string
  description = "Application Load Balancer name"
}

variable "target_group_name" {
  type        = string
  description = "Target Group name"
}

variable "alb_security_group_name" {
  type        = string
  description = "ALB Security Group name"
}