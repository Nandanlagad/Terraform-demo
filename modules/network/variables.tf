variable "vpc_cidr" {
  type = string
}

variable "subnet_1_cidr" {
  type = string
}

variable "subnet_2_cidr" {
  type = string
}

variable "security_group_name" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "igw_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "az_1" {
  type = string
}

variable "az_2" {
  type = string
}

variable "db_subnet_name" {
  type    = string
  default = null
}

variable "db_subnet_cidr" {
  type    = string
  default = null
}

variable "db_subnet_az" {
  type    = string
  default = null
}
variable "private_route_table_name" {
  type    = string
  default = null
}
variable "subnet_1_name" {
  type    = string
  default = null
}
variable "subnet_2_name" {
  type    = string
  default = null
}