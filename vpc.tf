resource "aws_vpc" "this" {
  cidr_block  = "10.0.0.0/16"
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_subnet" "public" {
  for_each = locals.public_subnets

  vpc_id = aws_vpc.this.id

  cider_block = each.value.cidr_block
  availability_zone = each_key
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this_id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet_public

  subnet_id = each_value.id
  route_table.id = aws_route_table.public.id
}

resource "aws_subnet" "private" {
  for_each = locals.private_subnets

  vpc_id = aws_vpc.this.id

  cider_block = each.value.cidr_block
  availability_zone = each_key
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this_id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = 
  }
}

resource "aws_route_table_association" "private" {
  for_each = aws_subnet_private

  subnet_id = each_value.id
  route_table.id = aws_route_table.private.id
}
