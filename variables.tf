variable "vpc" {
  type        = string
  default     = ""
  description = "main VPC"
}

variable "private_subnet" {
  type        = string
  default     = ""
  description = "private subnet"
}

variable "instance_name" {
  type        = string
  default     = ""
  description = "Name of the EC2 instance"
}
variable "security_group_name" {
  type        = string
  default     = ""
  description = "Name of the security group"
}
variable "instance_type" {
  type        = string
  default     = ""
  description = "Type of the EC2 instance"
}
