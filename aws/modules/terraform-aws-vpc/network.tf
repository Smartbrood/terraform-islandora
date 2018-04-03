resource "aws_vpc" "this" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"
  tags                 = "${var.tags}"
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.public_subnet_a}"
  availability_zone = "${var.region}a"
  tags              = "${merge(var.tags, map("Name", "public_subnet_a"))}" 
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.public_subnet_b}"
  availability_zone = "${var.region}b"
  tags              = "${merge(var.tags, map("Name", "public_subnet_b"))}" 
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.public_subnet_c}"
  availability_zone = "${var.region}c"
  tags              = "${merge(var.tags, map("Name", "public_subnet_c"))}" 
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.private_subnet_a}"
  availability_zone = "${var.region}a"
  tags              = "${merge(var.tags, map("Name", "private_subnet_a"))}" 
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.private_subnet_b}"
  availability_zone = "${var.region}b"
  tags              = "${merge(var.tags, map("Name", "private_subnet_b"))}" 
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.private_subnet_c}"
  availability_zone = "${var.region}c"
  tags              = "${merge(var.tags, map("Name", "private_subnet_c"))}" 
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.this.id}"
  tags   = "${merge(var.tags, map("Name", "public"))}" 
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.this.id}"
  tags   = "${merge(var.tags, map("Name", "private"))}" 
}

resource "aws_main_route_table_association" "public" {
  vpc_id         = "${aws_vpc.this.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private_subnet_a" {
  subnet_id      = "${aws_subnet.private_subnet_a.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_subnet_b" {
  subnet_id      = "${aws_subnet.private_subnet_b.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_subnet_c" {
  subnet_id      = "${aws_subnet.private_subnet_c.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_internet_gateway" "public" {
  vpc_id = "${aws_vpc.this.id}"
  tags   = "${merge(var.tags, map("Name", "public"))}" 
}

resource "aws_route" "public_to_internet" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.public.id}"
}
