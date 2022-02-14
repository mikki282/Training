resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"
    tags = {
        Name = "my_vpc"
    }
}
resource "aws_subnet" "public" {
    count=2
    vpc_id = aws_vpc.my_vpc.id
    cidr_block =var.cidr_pub_subnet[count.index]
    availability_zone= element(var.availability_zones1,count.index)
    tags ={
        Name = "public_subnet-${count.index + 1}"
    }
}

resource "aws_subnet" "private" {
    count=2
    vpc_id = aws_vpc.my_vpc.id
    cidr_block =var.cidr_pvt_subnet[count.index]
    availability_zone= element(var.availability_zones2,count.index)
    tags ={
        Name = "private_subnet-${count.index + 1}"
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
    subnet_id = element(aws_subnet.public.*.id, 1)
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
    count=2
    subnet_id = aws_subnet.public.*.id[count.index]
    route_table_id = aws_route_table.public_rt.id
    depends_on= [aws_route_table.public_rt , aws_subnet.public]
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
    count=2
    subnet_id = aws_subnet.private.*.id[count.index]
    route_table_id = aws_route_table.private_rt.id
}