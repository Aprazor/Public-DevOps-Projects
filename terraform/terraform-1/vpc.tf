resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Subnet1"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "Subnet2"
  }
}

resource "aws_internet_gateway" "myvpc_igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "myvpc-igw"
  }

}

resource "aws_route_table" "myvpc-rt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myvpc_igw.id
  }
  tags = {
    name = "myvpc-route-table"
  }
}

resource "aws_main_route_table_association" "myvpc-rt-asn" {
  vpc_id         = aws_vpc.myvpc.id
  route_table_id = aws_route_table.myvpc-rt.id
}
