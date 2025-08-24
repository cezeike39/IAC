variable "region" {
  type        = string
  description = "This is the region for launching AWS resources"
}

# One variable for all 3 config above
# Name: vpc_config
variable "vpc_config" {
  type = object({
    name             = string
    cidr             = string
    instance_tenancy = optional(string, "default")
  })
  description = "A Map of VPC configuration"
}

# Subnet Configuration
variable "subnet_config" {
  type = object({
    # Public subnet
    public_sn_name     = string
    public_sn_new_bits = number
    public_sn_netnum   = number

    # Private subnet
    private_sn_name     = string
    private_sn_new_bits = number
    private_sn_netnum   = number
  })
  description = "A Map of Subnet configuration"
}

# EC2 Instance Configuration
variable "ec2_config" {
  type = object({
    name                        = string
    type                        = string
    associate_public_ip_address = optional(bool, true)
  })
  description = "A Map of EC2 Instance configuration"
}