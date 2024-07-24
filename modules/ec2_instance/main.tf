resource "aws_instance" "Public_Instance" {
  ami                    = "ami-0ff591da048329e00"  # Ensure this AMI is compatible with Amazon Linux 2023
  instance_type          = "t3.micro"
  subnet_id              = var.public_subnet_id
  security_groups        = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name               = var.ssh_key_name

  user_data = file("${path.module}/../../scripts/install_nginx.sh")

  tags = {
    Name = "Public-Instance"
  }
}

resource "aws_instance" "Private_Instance" {
  ami                    = "ami-0ff591da048329e00"  # Ensure this AMI is compatible with Amazon Linux 2023
  instance_type          = "t3.micro"
  subnet_id              = var.private_subnet_id
  security_groups        = [var.private_security_group_id]
  associate_public_ip_address = false
  key_name               = var.ssh_key_name

  user_data = file("${path.module}/../../scripts/install_postgresql.sh")

  tags = {
    Name = "Private-Instance"
  }
}
