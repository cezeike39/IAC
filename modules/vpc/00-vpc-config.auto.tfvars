# AWS Region
region = "us-west-2"

# VPC values
vpc_config = {
  name = "terraform-vpc"
  cidr = "10.0.0.0/16"
}

# Subnet values
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
  name                        = "terraform-ec2-instance"
  type                        = "t2.micro"
  associate_public_ip_address = false
}