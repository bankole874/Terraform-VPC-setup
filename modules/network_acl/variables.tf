variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR block of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "The Private Subnet ID"
  type        = string
}
