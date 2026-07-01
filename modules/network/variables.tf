variable "vpc_cidr" {
  type        = string
  default     = ""
  description = "VPC CIDR block"
}
variable "subnet_1_cidr" {
  type        = string
  default     = ""
  description = "Subnet CIDR block"
}
variable "subnet_2_cidr" {
  type        = string
  default     = ""
  description = "Subnet CIDR block"
}
variable "security_group_name" {
  type        = string
  default     = ""
  description = "Security group name"
}
variable "route_table_name" {
  type        = string
  default     = ""
  description = "Route table name"
}

variable "igw_name" {
  type        = string
  default     = ""
  description = "Internet Gateway name"
}
variable "vpc_name" {
  type        = string
  default     = ""
  description = "VPC name"
}

variable "az_1" {
  type        = string
  description = "Availability zone 1"
}
variable "az_2" {
  type        = string
  description = "Availability zone 2"
}