output "web_instance" {
  value       = aws_instance.web_instance.id
  description = "ID of the web instance"

}
