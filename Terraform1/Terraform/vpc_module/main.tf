
resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"
    tags = {
        Name = "my_vpc"
    }
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block =var.cidr_pub_subnet
    tags ={
        Name = "public_subnet"
    }
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block =var.cidr_pvt_subnet
    tags ={
        Name = "private_subnet"
    }
}
resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.my_vpc.id
    tags ={
        Name ="my_igw"
    }
}
resource "aws_eip" "elastic_ip" {
  vpc = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
      Name = "Nat_gw"
  }
}
resource "aws_nat_gateway" "nat"{
    allocation_id = aws_eip.elastic_ip.id
    subnet_id = aws_subnet.public.id
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = var.igw_cidr
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "pub_rt"
    }
}
resource "aws_route_table_association" "public"{
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = var.gw_cidr
        gateway_id = aws_nat_gateway.nat.id
    }
    tags ={
        Name = "pvt_rt"
    }
}
resource "aws_route_table_association" "private"{
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private_rt.id
}
