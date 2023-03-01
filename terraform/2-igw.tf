resource "aws_internet_gateway" "igw-proj9" {
  vpc_id = aws_vpc.proj9.id

  tags = {
    "Name" = "igw-proj9"
  }
}