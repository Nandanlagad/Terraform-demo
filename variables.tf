
variable "main_vpc_cidr" {
  type        = string
  description = "Main VPC CIDR block"
}

variable "main_vpc_name" {
  type        = string
  description = "Main VPC name"
}

variable "main_subnet_1_cidr" {
  type        = string
  description = "Main public subnet CIDR"
}

variable "main_subnet_1_name" {
  type        = string
  description = "Main public subnet name"
}
variable "main_az_1" {
  type        = string
  description = "Main Availability Zone 1"
}
variable "main_security_group_name" {
  type        = string
  description = "Main Security Group name"
}
variable "main_route_table_name" {
  type        = string
  description = "Main public route table name"
}

variable "main_igw_name" {
  type        = string
  description = "Main internet gateway name"
}

variable "iam_role_name" {
  type        = string
  description = "IAM role name for the application"
}