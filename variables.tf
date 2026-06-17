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
variable "security_group" {
  type        = string
  default     = ""
  description = "Security group for the EC2 instance"
}
variable "storage_bucket" {
  type        = string
  default     = ""
  description = "S3 bucketfor remote backend"
}
variable "dynamo_db" {
  type        = string
  default     = ""
  description = "db for remote backend "
}
