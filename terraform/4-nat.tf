resource "aws_eip" "nat_proj9" {
  vpc = true

  tags = {
    "Name" = "nat_proj9"
  }
}

resource "aws_nat_gateway" "nat-gw-proj9" {
  allocation_id = aws_eip.nat_proj9.id
  subnet_id = aws_subnet.public-us-east-1a.id

  tags = {
    "Name" = "nat-gw-proj9"
  }

  depends_on = [
    aws_internet_gateway.igw-proj9
  ]
}