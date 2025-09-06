# VPC Configration
resource "aws_vpc" "main" {

  cidr_block       = var.vpc_config.cidr
  instance_tenancy = var.vpc_config.instance_tenancy

  tags = {
    Name = var.vpc_config.name
  }
}

# Function: cidrsubnet(prefix, newbits, netnum)

# Example VPC CIDR: 10.0.0.0/16 (prefix = 16)

# Calculating new bits (newbits):
# /24 -> (16 + x = 24) = 8 bits
# /16 -> (16 +x = 16) = 0 bits
# /28 -> (16 + x = 28) = 12 bits

# Calculating new network number (netnum):
# Formular: Between 0 and 2^(newbits) - 1
# Subnet index [0, 1, 2, 3, 4, 5, 6, 7...]

# 8 bits:
# network number: (2^8) - 1 = 255

# Public subnet 
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, var.subnet_config.public_sn_new_bits, var.subnet_config.public_sn_netnum)

  tags = {
    Name = var.subnet_config.public_sn_name
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public_aws_route_table"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.gw]
}

# Private subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, var.subnet_config.private_sn_new_bits, var.subnet_config.private_sn_netnum)

  tags = {
    Name = var.subnet_config.private_sn_name
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private_aws_route_table"
  }
}

resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

resource "aws_route_table_association" "route" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_config.type

  tags = {
    Name = var.ec2_config.name
  }
}