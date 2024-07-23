variable "public_subnet_id" {
  description = "The Public Subnet ID"
  type        = string
}

variable "private_subnet_id" {
  description = "The Private Subnet ID"
  type        = string
}

variable "public_security_group_id" {
  description = "The Public Security Group ID"
  type        = string
}

variable "private_security_group_id" {
  description = "The Private Security Group ID"
  type        = string
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair"
  type        = string
}
