# VPC Provision
resource "aws_vpc" "terraform" {
  cidr_block = var.vpc_cidr

  tags = var.vpc_tags
}

# Subnets Provision
resource "aws_subnet" "public" {
  vpc_id               = aws_vpc.terraform.id
  cidr_block           = var.public_subnet_cidr
  availability_zone_id = var.public_az

  tags = var.public_subnet_tags
}

resource "aws_subnet" "private" {
  vpc_id               = aws_vpc.terraform.id
  cidr_block           = var.private_subnet_cidr
  availability_zone_id = var.private_az

  tags = var.private_subnet_tags
}

# Route Table
resource "aws_route_table" "test" {
  vpc_id = aws_vpc.terraform.id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block = var.internet_route_cidr
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = var.route_table_tags
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.terraform.id
  route_table_id = aws_route_table.test.id
}

# Security Group
resource "aws_security_group" "instances" {
  name        = "instances"
  description = "Allow HTTP, SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.terraform.id

  tags = var.security_group_tags
}

# Security Group Rules
resource "aws_vpc_security_group_ingress_rule" "tcp" {
  security_group_id = aws_security_group.instances.id
  description       = var.http_ingress.description
  cidr_ipv4        = var.http_ingress.cidr_ipv4
  from_port        = var.http_ingress.from_port
  ip_protocol      = var.http_ingress.ip_protocol
  to_port          = var.http_ingress.to_port
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.instances.id
  description       = var.ssh_ingress.description
  cidr_ipv4        = var.ssh_ingress.cidr_ipv4
  from_port        = var.ssh_ingress.from_port
  ip_protocol      = var.ssh_ingress.ip_protocol
  to_port          = var.ssh_ingress.to_port
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.instances.id
  description       = "Allow all outbound traffic"
  cidr_ipv4        = "0.0.0.0/0"
  ip_protocol      = "-1" # specify all protocols
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform.id

  tags = var.igw_tags
}
