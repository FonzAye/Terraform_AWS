# Terraform AWS Infrastructure

## Overview
This project contains Terraform configurations to provision and manage AWS resources, including VPCs, subnets, security groups, EC2 instances, and other cloud infrastructure components. It allows for the automation of cloud setups using Terraform.

## Features
- Provision AWS resources (e.g., VPC, subnets, security groups)
- Example EC2 instance setup
- Supports AWS best practices (e.g., using private and public subnets)

## Requirements
- Terraform 1.x or later
- AWS CLI configured with appropriate credentials
- AWS account

## Setup Instructions
1. Clone the repository:
    ```sh
    git clone https://github.com/FonzAye/Terraform_AWS.git
    cd Terraform_AWS
    ```
2. Create your AWS S3 backend or use local. If you want to use remote backend modify the ```web app/main.tf``` file.
3. Initialize Terraform:
    ```sh
    terraform init
    ```
4. Apply the configuration:
    ```sh
    terraform apply
    ```

## Customization
- Modify the variables in `variables.tf` to adjust the resources.

## Outputs
After applying, Terraform will display output values such as the EC2 instance ID.
