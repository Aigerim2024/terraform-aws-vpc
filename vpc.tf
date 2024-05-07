provider "aws" {
  region = var.region
}

resource "aws_vpc" "terraform6" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "public_subnets" {
  count                  = 3
  vpc_id                 = aws_vpc.terraform6.id
  cidr_block             = "10.0.${count.index}.0/24"
  availability_zone      = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count                  = 3
  vpc_id                 = aws_vpc.terraform6.id
  cidr_block             = "10.0.${count.index + 10}.0/24"  
  availability_zone      = element(var.availability_zones, count.index)

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}
