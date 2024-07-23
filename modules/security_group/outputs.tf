output "public_security_group_id" {
  value = aws_security_group.publicSG.id
}

output "private_security_group_id" {
  value = aws_security_group.privateSG.id
}
