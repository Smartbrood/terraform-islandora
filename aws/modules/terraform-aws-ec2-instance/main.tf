resource "aws_instance" "this" {
  count                    = "${var.count}"
  ami                      = "${var.ami}"
  instance_type            = "${var.instance_type}"
  user_data                = "${var.user_data}"
  subnet_id                = "${var.subnet_id}"
  key_name                 = "${var.key_name}"
  monitoring               = "${var.monitoring}"
  vpc_security_group_ids   = ["${var.vpc_security_group_ids}"]
  iam_instance_profile     = "${var.iam_instance_profile}"
  private_ip               = "${var.private_ip}"
  ipv6_address_count       = "${var.ipv6_address_count}"
  ipv6_addresses           = "${var.ipv6_addresses}"
  ebs_optimized            = "${var.ebs_optimized}"
  volume_tags              = "${var.volume_tags}"
  root_block_device        = "${var.root_block_device}"
  ebs_block_device         = "${var.ebs_block_device}"
  ephemeral_block_device   = "${var.ephemeral_block_device}"
  source_dest_check        = "${var.source_dest_check}"
  disable_api_termination  = "${var.disable_api_termination}"
  availability_zone        = "${var.availability_zone}"
  tenancy                  = "${var.tenancy}"

#  placement_group          = "${var.placement_group}"

  associate_public_ip_address          = "${var.associate_public_ip_address}"
  instance_initiated_shutdown_behavior = "${var.instance_initiated_shutdown_behavior}"

  tags = "${merge(var.tags, map("Name", format("%s-%d", var.name, count.index+1)))}"
}
