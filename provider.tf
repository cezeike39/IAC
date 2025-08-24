terraform {
  required_version = ">= 1.2" # Required version for Terraform

  # cloud {
  #   organization = "cezeike39"

  #   workspaces {
  #     project = "Learn Terraform"
  #     name    = "aws-network-provisioning"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
}

provider "aws" {
  # region = "us-west-2"
  region = var.region
}