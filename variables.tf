#############################
# Main Environment
#############################

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

variable "main_subnet_2_cidr" {
  type        = string
  description = "Main private subnet CIDR"
}

variable "main_subnet_2_name" {
  type        = string
  description = "Main private subnet name"
}

variable "main_az_1" {
  type        = string
  description = "Main Availability Zone 1"
}

variable "main_az_2" {
  type        = string
  description = "Main Availability Zone 2"
}

variable "main_igw_name" {
  type        = string
  description = "Main Internet Gateway name"
}

variable "main_route_table_name" {
  type        = string
  description = "Main Public Route Table name"
}

variable "main_private_route_table_name" {
  type        = string
  description = "Main Private Route Table name"
}

variable "main_security_group_name" {
  type        = string
  description = "Main Security Group name"
}

#############################
# Database
#############################

variable "db_subnet_name" {
  type        = string
  description = "Database subnet name"
}

variable "db_subnet_cidr" {
  type        = string
  description = "Database subnet CIDR"
}

variable "db_subnet_az" {
  type        = string
  description = "Database subnet Availability Zone"
}

#############################
# Dev Environment
#############################

variable "dev_vpc_cidr" {
  type        = string
  description = "Dev VPC CIDR block"
}

variable "dev_vpc_name" {
  type        = string
  description = "Dev VPC name"
}

variable "dev_subnet_1_cidr" {
  type        = string
  description = "Dev public subnet CIDR"
}

variable "dev_subnet_1_name" {
  type        = string
  description = "Dev public subnet name"
}

variable "dev_subnet_2_cidr" {
  type        = string
  description = "Dev private subnet CIDR"
}

variable "dev_subnet_2_name" {
  type        = string
  description = "Dev private subnet name"
}

variable "dev_az_1" {
  type        = string
  description = "Dev Availability Zone 1"
}

variable "dev_az_2" {
  type        = string
  description = "Dev Availability Zone 2"
}

variable "dev_igw_name" {
  type        = string
  description = "Dev Internet Gateway name"
}

variable "dev_route_table_name" {
  type        = string
  description = "Dev Public Route Table name"
}

variable "dev_security_group_name" {
  type        = string
  description = "Dev Security Group name"
}