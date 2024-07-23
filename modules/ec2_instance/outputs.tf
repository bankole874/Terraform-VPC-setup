output "public_instance_id" {
  value = aws_instance.Public_Instance.id
}

output "private_instance_id" {
  value = aws_instance.Private_Instance.id
}
