
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_1_id" {
  value = aws_subnet.subnet_1.id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}
