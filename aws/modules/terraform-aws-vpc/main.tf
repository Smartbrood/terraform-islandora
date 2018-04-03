data "null_data_source" "values" {
  inputs = {
    vpc                   = "${aws_vpc.this.id}"
    vpc_cidr_block        = "${aws_vpc.this.cidr_block}" 
    public_subnet_a       = "${aws_subnet.public_subnet_a.id}"
    public_subnet_b       = "${aws_subnet.public_subnet_b.id}"
    public_subnet_c       = "${aws_subnet.public_subnet_c.id}"
    private_subnet_a      = "${aws_subnet.private_subnet_a.id}"
    private_subnet_b      = "${aws_subnet.private_subnet_b.id}"
    private_subnet_c      = "${aws_subnet.private_subnet_c.id}"
    route_table_public    = "${aws_route_table.public.id}"
    route_table_private   = "${aws_route_table.private.id}"
  }
}
