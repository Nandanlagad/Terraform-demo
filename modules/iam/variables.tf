variable "role_name"{
type        = string
description = "The name of the IAM role to be created."
}
variable "assume_role_policy" {
type        = string
description = "The policy that grants an entity permission to assume the role."
}