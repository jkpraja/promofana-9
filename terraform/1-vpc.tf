resource "aws_vpc" "proj9" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "proj9"
  }
}