
variable "main_vpc_cidr" {
  type        = string
  description = "Main VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "main_vpc_name" {
  type        = string
  description = "Main VPC name"
  default     = "main-vpc"
}

variable "main_subnet_1_cidr" {
  type        = string
  description = "Main public subnet CIDR block"
  default     = "10.0.1.0/24"
}
variable "main_subnet_1_name" {
  type        = string
  description = "Main public subnet name"
  default     = "main-subnet-1"
}
variable "main_az_1" {
  type        = string
  description = "Main Availability Zone 1"
  default     = "ap-south-1a"
}
variable "main_security_group_name" {
  type        = string
  description = "Main Security Group name"
  default     = "main-security-group"
}
variable "main_route_table_name" {
  type        = string
  description = "Main public route table name"
  default     = "main-route-table"
}

variable "main_igw_name" {
  type        = string
  description = "Main internet gateway name"
  default     = "main-igw"
}

variable "iam_role_name" {
  type        = string
  description = "IAM role name for the application"
  default     = "app-role"
}
