resource "aws_security_group" "publicSG" {
  name        = "publicSG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "public-security-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "a" {
  security_group_id = aws_security_group.publicSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "b" {
  security_group_id = aws_security_group.publicSG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "c" {
  security_group_id = aws_security_group.publicSG.id
  cidr_ipv4         = "129.205.121.42/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "a" {
  security_group_id = aws_security_group.publicSG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "privateSG" {
  vpc_id = var.vpc_id

  tags = {
    Name = "private-security-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "d" {
  security_group_id = aws_security_group.privateSG.id
  cidr_ipv4         = var.public_subnet_cidr
  from_port         = 5432 # Replace with the required port for database (PostgreSQL)
  ip_protocol       = "tcp"
  to_port           = 5432 # Replace with the required port for database (PostgreSQL)
}

resource "aws_vpc_security_group_egress_rule" "b" {
  security_group_id = aws_security_group.privateSG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
