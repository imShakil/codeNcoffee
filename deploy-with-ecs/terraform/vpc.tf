resource "aws_vpc" "cnc_vpc" {

  cidr_block = var.vpc_cidr

  tags = {
    Name = "cnc_vpc"
  }
}

resource "aws_subnet" "cnc_vpc_public_subnets" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.cnc_vpc.id
  cidr_block        = var.public_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "cnc-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "cnc_igw" {

  vpc_id = aws_vpc.cnc_vpc.id

  tags = {
    Name = "cnc-IgW"
  }
}

resource "aws_route_table" "cnc_public_rt" {

  vpc_id = aws_vpc.cnc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cnc_igw.id
  }

  tags = {
    Name = "cnc-rtb-public"
  }
}

resource "aws_route_table_association" "cnc_public_subnet_routes" {
  count          = length(aws_subnet.cnc_vpc_public_subnets)
  subnet_id      = aws_subnet.cnc_vpc_public_subnets[count.index].id
  route_table_id = aws_route_table.cnc_public_rt.id
}

data "aws_availability_zones" "available" {
  state = "available"
}
