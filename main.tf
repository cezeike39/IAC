provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "chisomp-bucket"
    key    = "terraform/state"
    region = "us-east-2"
  }
}

module "vpc" {
  source = "./modules/vpc"
  region = "us-west-2"
  vpc_config = {
    name = "chisom"
    cidr = "10.0.0.0/16"
  }

  subnet_config = {
  # Private subnet values  
  private_sn_name     = "terraform-private-sn"
  private_sn_new_bits = 8
  private_sn_netnum   = 2

  # Public subnet values  
  public_sn_name     = "terraform-public-sn"
  public_sn_new_bits = 8
  public_sn_netnum   = 4
}

# EC2 values
ec2_config = {
  name                        = "chisom"
  type                        = "t3.micro"
  associate_public_ip_address = false
}

}

