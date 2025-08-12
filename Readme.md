# Terraform AWS VPC and EC2 Setup

This Terraform configuration creates a basic AWS networking setup including a VPC, public and private subnets, internet gateway, NAT gateway, route tables, and launches an EC2 instance in the public subnet.

## Resources Created

- **VPC:**  
  A Virtual Private Cloud with CIDR block `10.0.0.0/16`.

- **Public Subnet:**  
  CIDR block `10.0.1.0/24`, with routing to the internet via an Internet Gateway.

- **Private Subnet:**  
  CIDR block `10.0.11.0/24`, with routing to the internet through a NAT Gateway.

- **Internet Gateway:**  
  Attached to the VPC for internet access for public subnet resources.

- **Elastic IP:**  
  Allocated for the NAT Gateway.git checkout -b feature/your-feature-name


- **NAT Gateway:**  
  Allows outbound internet access for resources in the private subnet.

- **Route Tables:**  
  - Public route table with route to the Internet Gateway.  
  - Private route table with route to the NAT Gateway.

- **Route Table Associations:**  
  Associating public subnet with the public route table and private subnet with the private route table.

- **EC2 Instance:**  
  - Launched in the public subnet.  
  - Uses the latest Ubuntu 20.04 LTS AMI (x86_64).  
  - Instance type: `t3.micro`.  
  - Assigned a public IP address.

## Prerequisites

- Terraform installed (version 1.0 or newer recommended)  
- AWS CLI configured with credentials having permissions to create VPC, EC2, and related resources.  
- AWS account with appropriate limits and permissions.

## Usage

1. Clone this repo (if applicable) or place the Terraform files in a directory.

2. Initialize Terraform:

   ```bash
   terraform init..
