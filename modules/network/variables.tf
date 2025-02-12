

# variable "s3_bucket_name" {
#   description = "S3 bucket name for Terraform backend"
#   type        = string
# }

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/24"
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = { Name = "terraform" }
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "192.168.0.0/28"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "192.168.0.16/28"
}

variable "public_az" {
  description = "Availability Zone ID for public subnet"
  type        = string
  default     = "euc1-az2"
}

variable "private_az" {
  description = "Availability Zone ID for private subnet"
  type        = string
  default     = "euc1-az2"
}

variable "public_subnet_tags" {
  description = "Tags for public subnet"
  type        = map(string)
  default     = { Name = "public" }
}

variable "private_subnet_tags" {
  description = "Tags for private subnet"
  type        = map(string)
  default     = { Name = "private" }
}

variable "internet_route_cidr" {
  description = "CIDR block for internet route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "route_table_tags" {
  description = "Tags for the route table"
  type        = map(string)
  default     = { Name = "terraform" }
}

variable "security_group_tags" {
  description = "Tags for the security group"
  type        = map(string)
  default     = { Name = "instances" }
}

variable "http_ingress" {
  description = "Ingress rule for HTTP"
  type = object({
    description = string
    cidr_ipv4   = string
    from_port   = number
    ip_protocol = string
    to_port     = number
  })
  default = {
    description = "Allow HTTP inbound traffic"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 80
    ip_protocol = "tcp"
    to_port     = 80
  }
}

variable "ssh_ingress" {
  description = "Ingress rule for SSH"
  type = object({
    description = string
    cidr_ipv4   = string
    from_port   = number
    ip_protocol = string
    to_port     = number
  })
  default = {
    description = "Allow SSH inbound traffic"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 22
    ip_protocol = "tcp"
    to_port     = 22
  }
}

variable "igw_tags" {
  description = "Tags for the Internet Gateway"
  type        = map(string)
  default     = { Name = "main" }
}
