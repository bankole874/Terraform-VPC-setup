output "public_subnet_acl_id" {
  value = aws_network_acl.Public_Subnet_NACL.id
}

output "private_subnet_acl_id" {
  value = aws_network_acl.Private_Subnet_NACL.id
}
