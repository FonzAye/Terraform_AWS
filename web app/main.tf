terraform {
  // Remote backend
  backend "s3" {
    bucket         = "terraform-20250212151906931400000001" # REPLACE WITH YOUR BUCKET NAME
    key            = "tfstate/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tfstate_locking"
    encrypt        = true
}

  required_providers {
    aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "../modules/network"

  # Input Variables
}

module "compute" {
  source = "../modules/compute"
}

output "instance_id" {
  value = module.compute.instance_id // Output from module compute
}