variable "vpc_cidr" {
  type        = string
  default     = ""
  description = "VPC CIDR block"
}
variable "subnet_cidr" {
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
variable "subnet_name" {
  type        = string
  default     = ""
  description = "Subnet name"
}
