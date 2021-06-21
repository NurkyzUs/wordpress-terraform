resource "aws_vpc" "vpc_1" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env}-vpc"
    Environment = var.env
    Project = var.project_name
  }
}

#### create an internet gateway ###

resource "aws_internet_gateway" "int_gateway" {
  vpc_id = aws_vpc.vpc_1.id                      

  tags = {
    Name = "${var.env}-internet_gateway"
    Environment = var.env
    Project = var.project_name
  }
}

#### create a public Route Table and attach(route) to the  internet gateway ###

resource "aws_route_table" "pub-route-table" {
  vpc_id      = aws_vpc.vpc_1.id
  
  route {
  cidr_block  = var.open_cidr_block
  gateway_id  = aws_internet_gateway.int_gateway.id
  }
  tags = {
    Name = "${var.env}-pub-route-table"
    Environment  = var.env
    Project      = var.project_name
   }
}


 #### create 3 public subnets ###

resource "aws_subnet" "pub_subnet1" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = var.cidr_pub_sub1

  tags = {
    Name = "${var.env}-pub_sub_1"
    Environment = var.env
  }
}

resource "aws_subnet" "pub_subnet2" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = var.cidr_pub_sub2

  tags = {
    Name = "${var.env}-pub_sub_2"
    Environment = var.env
    Project = var.project_name
  }
}

resource "aws_subnet" "pub_subnet3" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = var.cidr_pub_sub3

 tags = {
    Name = "${var.env}-pub_sub_3"
    Environment = var.env
    Project = var.project_name
  }
}

#### associate public route table with 3 public subnets ####

resource "aws_route_table_association" "pub-subnet1" {
  route_table_id = aws_route_table.pub-route-table.id
  subnet_id = aws_subnet.pub_subnet1.id
}

resource "aws_route_table_association" "pub-subnet2" {
  route_table_id = aws_route_table.pub-route-table.id
  subnet_id = aws_subnet.pub_subnet2.id
}

resource "aws_route_table_association" "pub-subnet3" {
  route_table_id = aws_route_table.pub-route-table.id
  subnet_id = aws_subnet.pub_subnet3.id
}


#### create EIP for a NAT gateway ##

resource "aws_eip" "eip_for_nat" {
  vpc = true

  tags = {
    Name = "${var.env}-eip"
    Environment = var.env
    Project = var.project_name
  }
}


#### create NAT gateway ####

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip_for_nat.id
  subnet_id     = aws_subnet.pri_subnet1.id 

  tags = local.common_tags
}     

#### create private route table and attach (route) it to NAT gateway###

resource "aws_route_table" "pri-route-table" {
  vpc_id          = aws_vpc.vpc_1.id
  
  route {
  cidr_block      = var.open_cidr_block
  nat_gateway_id  = aws_nat_gateway.nat_gateway.id
  }
  tags = local.common_tags
 }

 #### create 3 private subnets ####

resource "aws_subnet" "pri_subnet1" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = var.cidr_pri_sub1

  tags = local.common_tags
}

resource "aws_subnet" "pri_subnet2" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = var.cidr_pri_sub2

  tags = local.common_tags
}
resource "aws_subnet" "pri_subnet3" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = var.cidr_pri_sub3

  tags = local.common_tags
}
#### associate private route table with 3 subnets ####

resource "aws_route_table_association" "pri-subnet1" {
  route_table_id = aws_route_table.pri-route-table.id
  subnet_id = aws_subnet.pri_subnet1.id
}

resource "aws_route_table_association" "pri-subnet2" {
  route_table_id = aws_route_table.pri-route-table.id
  subnet_id = aws_subnet.pri_subnet2.id
}

resource "aws_route_table_association" "pri-subnet3" {
  route_table_id = aws_route_table.pri-route-table.id
  subnet_id = aws_subnet.pri_subnet3.id
}