variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "instance_name" {
  type = string
}
variable "key_name" {
  type        = string
  description = "EC2 Key Pair name"
}
variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name for the EC2 instance."
}
