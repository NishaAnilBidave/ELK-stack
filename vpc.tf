resource "aws_vpc" "lab_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "lab_vpc"
    
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_public

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_private1

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.lab_vpc.id
  cidr_block = var.cidr_private2

  tags = {
    Name = "private2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.lab_vpc.id
  

  tags = {
    Name = "main-internet gateway"
  }
}


resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "nat_gw" {
  
  vpc      = true
}
