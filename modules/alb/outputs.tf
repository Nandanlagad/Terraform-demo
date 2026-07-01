output "alb_dns_name" {
  value       = aws_lb.alb.dns_name
  description = "DNS name of the ALB"
}
output "alb_arn" {
  value       = aws_lb.alb.arn
  description = "ARN of the ALB"
}