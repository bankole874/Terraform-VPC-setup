provider "aws" {
  region = "us-west-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "nat_gateway" {
  source = "./modules/nat_gateway"
  public_subnet_id = module.subnet.public_subnet_id
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.internet_gateway.igw_id
  nat_gateway_id = module.nat_gateway.nat_gateway_id
  public_subnet_id = module.subnet.public_subnet_id
  private_subnet_id = module.subnet.private_subnet_id
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidr = module.subnet.public_subnet_cidr
}

module "network_acl" {
  source = "./modules/network_acl"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidr = module.subnet.public_subnet_cidr
  private_subnet_id = module.subnet.private_subnet_id
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  public_subnet_id = module.subnet.public_subnet_id
  private_subnet_id = module.subnet.private_subnet_id
  public_security_group_id = module.security_group.public_security_group_id
  private_security_group_id = module.security_group.private_security_group_id
  ssh_key_name = var.ssh_key_name
}
