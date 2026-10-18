output "instance_profile_name" {
  value       = aws_iam_instance_profile.app_profile.name
  description = "The name of the EC2 IAM instance profile."
}
