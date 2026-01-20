# Terraform AWS VPC and EC2 Setup

This Terraform configuration provisions a basic AWS networking setup, including a VPC, public and private subnets, internet gateway, NAT gateway, route tables, and an EC2 instance in the public subnet.

---

## 📦 Resources Created

### Networking
- **VPC**
  - CIDR block: `10.0.0.0/16`
- **Public Subnet**
  - CIDR block: `10.0.1.0/24`
  - Routes internet traffic via an **Internet Gateway**.
- **Private Subnet**
  - CIDR block: `10.0.11.0/24`
  - Routes internet traffic via a **NAT Gateway**.
- **Internet Gateway**
  - Attached to the VPC for internet access for public subnet resources.
- **Elastic IP**
  - Allocated for the NAT Gateway.
- **NAT Gateway**
  - Allows outbound internet access for resources in the private subnet.

### Routing
- **Public Route Table**
  - Routes traffic to the Internet Gateway.
- **Private Route Table**
  - Routes traffic to the NAT Gateway.
- **Route Table Associations**
  - Public subnet → Public route table
  - Private subnet → Private route table

### Compute
- **EC2 Instance**
  - Launched in the public subnet.
  - AMI: Latest **Ubuntu 20.04 LTS** (x86_64)
  - Instance type: `t3.micro`
  - Public IP assigned.

---

## 🛠 Prerequisites

- Terraform **v1.0+** installed
- AWS CLI configured with an IAM user/role that can create VPC, EC2, and related resources
- AWS account with required permissions and limits
- (Optional) Terraform Cloud account if you want to use remote state

---

## 🚀 Usage

### 1️⃣ Clone the repository

## Configure Terraform Cloud (Optional)

terraform {
  cloud {
    organization = "cezeike39"

    workspaces {
      project = "Learn Terraform"
      name    = "aws-network-provisioning"
    }
  }
}

If you want to use Terraform Cloud:
Replace organization, project, and name with your own values from Terraform Cloud.

If you want to use local state instead:
Remove the entire cloud { ... } block.

Optionally, add a local backend:

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

## Initialize Terraform
terraform init

## Preview resources to be created
terraform plan

## Apply the configuration
terraform apply

## Destroy resources when done
terraform destroy

## ⚠️ Cost Warning
This setup creates AWS resources that may incur charges.
Remember to run terraform destroy when you no longer need them.