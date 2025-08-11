terraform {
  cloud {
    organization = "cezeike39"

    workspaces {
      project = "Learn Terraform"
      name    = "aws-network-provisioning"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
  required_version = ">= 1.2"
}
