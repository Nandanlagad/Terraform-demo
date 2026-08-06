output "role_name" {
  value       = aws_iam_role.app_role.name
  description = "The name of the IAM role created."
}
