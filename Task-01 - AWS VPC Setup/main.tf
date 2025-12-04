provider "aws" {
  region = "us-east-1"   # North Virginia
}

# Create VPC

resource "aws_vpc" "alok_vpc" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Alok_Patel_VPC"
  }
}

# Create Internet Gateway

resource "aws_internet_gateway" "alok_igw" {
  vpc_id = aws_vpc.alok_vpc.id

  tags = {
    Name = "AlokPatel_IGW"
  }
}

# Creating Four Subnets 2 Public and 2 Private Subnets

# Creating Public Subnet 1

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.alok_vpc.id
  cidr_block              = "192.168.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "AlokPatelPublicSubnet1"
  }
}

# Creating Public Subnet 2

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.alok_vpc.id
  cidr_block              = "192.168.16.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "AlokPatelPublicSubnet2"
  }
}

# Creating Private Subnet 1

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.alok_vpc.id
  cidr_block        = "192.168.32.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "AlokPatelPrivateSubnet1"
  }
}

# Creating Private Subnet 2

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.alok_vpc.id
  cidr_block        = "192.168.48.0/20"
  availability_zone = "us-east-1d"

  tags = {
    Name = "AlokPatelPrivateSubnet2"
  }
}

# Elastic IP for NAT Gateway 

resource "aws_eip" "alok_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "AlokPatel_NAT_EIP"
  }
}

# Creating Regional  NAT Gateway ( Newly Introduced )

resource "aws_nat_gateway" "alok_nat_gw" {
  allocation_id = aws_eip.alok_nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id   # NAT must be in PUBLIC subnet

  tags = {
    Name = "AlokPatelNGW"
  }

  depends_on = [aws_internet_gateway.alok_igw]
}

# Create Public Route Table

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.alok_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alok_igw.id
  }

  tags = {
    Name = "AlokPatelPublicRT"
  }
}

# Create Private Route Table

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.alok_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.alok_nat_gw.id
  }

  tags = {
    Name = "AlokPatelPrivateRT"
  }
}

# Route Table Association to Subnets

# For Public subnets
resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# For Private subnets
resource "aws_route_table_association" "private_assoc_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_assoc_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}
