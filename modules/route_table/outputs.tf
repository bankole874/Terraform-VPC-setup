output "public_route_table_id" {
  value = aws_route_table.PublicRouteTable.id
}

output "private_route_table_id" {
  value = aws_route_table.PrivateRouteTable.id
}
