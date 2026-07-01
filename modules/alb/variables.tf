variable "subnet_ids" {
  type        = list(string)
  description = "description"
}
variable "security_group_id" {
  type        = string
  default     = ""
  description = "description"
}
variable "instance_ids" {
  type        = list(string)
  default     = []
  description = "description"
}
variable "vpc_id" {
  type        = string
  description = "description"
}
variable "alb_name" {
  type        = string
  description = "description"
}
variable "target_group_name" {
  type        = string
  description = "description"
}
variable "alb_security_group_name" {
  type        = string
  description = "description"
}