resource "aws_vpc" "terravpc" {
  cidr_block = var.block1
  tags = {
    Name = var.vpcname
  }
}

resource "aws_subnet" "pubsub1" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = var.block2
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = var.pubsub1
  }

}

resource "aws_subnet" "pubsub2" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = var.block3
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
  Name = var.pubsub2 }

}

resource "aws_subnet" "privatesub1" {
  vpc_id            = aws_vpc.terravpc.id
  cidr_block        = var.block4
  availability_zone = "us-west-2a"
  tags = {
    Name = var.privatesub1
  }

}

resource "aws_internet_gateway" "terra_igw" {
  vpc_id = aws_vpc.terravpc.id
  tags = {
    Name = "Terra_vpc_IGW"
  }
}

resource "aws_route_table" "terra_route" {
  vpc_id = aws_vpc.terravpc.id
  route {
    cidr_block = var.block5
    gateway_id = aws_internet_gateway.terra_igw.id
  }
  tags = {
    Name = "Terra-routetable"
  }
}

resource "aws_route_table_association" "terraassosciate1" {

  route_table_id = aws_route_table.terra_route.id
  subnet_id      = aws_subnet.pubsub1
}

resource "aws_route_table_association" "terraassosciate2" {

  route_table_id = aws_route_table.terra_route.id
  subnet_id      = aws_subnet.pubsub2
}