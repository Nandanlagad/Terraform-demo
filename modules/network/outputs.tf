output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_1_id" {
  value = aws_subnet.subnet_1.id
}

output "subnet_2_id" {
  value = aws_subnet.subnet_2.id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}

output "db_subnet_id" {
  value = length(aws_subnet.db_subnet) > 0 ? aws_subnet.db_subnet[0].id : null
}