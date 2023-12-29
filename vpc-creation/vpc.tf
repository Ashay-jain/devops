#vpc creation

resource "aws_vpc" "vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
  }
}

# subnet creation 
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.10.1.0/24"

  tags = {
    Name = "public-subnet"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.10.2.0/24"

  tags = {
    Name = "private-subnet"
  }
}

# interet gateway creation of vpc 

resource "aws_internet_gateway" "ig" {
  tags = {
    Name = "ig-tf"
  }
}


# attaching internet gateway to vpc
resource "aws_internet_gateway_attachment" "gwa" {
  internet_gateway_id = aws_internet_gateway.ig.id
  vpc_id              = aws_vpc.vpc.id
}

# route table creation for public subnet 
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    Name = "public-route-table"
  }
}

#route table subnet association 

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

#creating eip for nat gateway
resource "aws_eip" "eip" {
  domain = "vpc"
  tags = {
    Name = "TF1-ip"
  }
}
#nat gateway creation
resource "aws_nat_gateway" "ng" {
  subnet_id     = aws_subnet.subnet2.id
  allocation_id = aws_eip.eip.id
  tags = {
    Name = "gw NAT"
  }
}

# route table creation for public subnet 
resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ng.id
  }
  tags = {
    Name = "private-route-table"
  }
}
#route table subnet association 

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt2.id
}
