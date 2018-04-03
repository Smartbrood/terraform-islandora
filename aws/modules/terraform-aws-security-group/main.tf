resource "aws_security_group" "this" {
  name        = "${var.name}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_security_group_rule" "ingress_rules" {
  count = "${length(var.ingress_rules)}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"

  cidr_blocks      = ["${var.ingress_cidr_blocks}"]

  from_port = "${element(var.rules[var.ingress_rules[count.index]], 0)}"
  to_port   = "${element(var.rules[var.ingress_rules[count.index]], 1)}"
  protocol  = "${element(var.rules[var.ingress_rules[count.index]], 2)}"
}

resource "aws_security_group_rule" "egress_rules" {
  count = "${length(var.egress_rules)}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"

  cidr_blocks      = ["${var.egress_cidr_blocks}"]

  from_port = "${element(var.rules[var.egress_rules[count.index]], 0)}"
  to_port   = "${element(var.rules[var.egress_rules[count.index]], 1)}"
  protocol  = "${element(var.rules[var.egress_rules[count.index]], 2)}"
}

resource "aws_security_group_rule" "ingress_rules_from_any" {
  count = "${length(var.ingress_rules_from_any)}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"

  cidr_blocks      = ["0.0.0.0/0"]

  from_port = "${element(var.rules[var.ingress_rules_from_any[count.index]], 0)}"
  to_port   = "${element(var.rules[var.ingress_rules_from_any[count.index]], 1)}"
  protocol  = "${element(var.rules[var.ingress_rules_from_any[count.index]], 2)}"
}

resource "aws_security_group_rule" "egress_rules_to_any" {
  count = "${length(var.egress_rules_to_any)}"

  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"

  cidr_blocks      = ["0.0.0.0/0"]

  from_port = "${element(var.rules[var.egress_rules_to_any[count.index]], 0)}"
  to_port   = "${element(var.rules[var.egress_rules_to_any[count.index]], 1)}"
  protocol  = "${element(var.rules[var.egress_rules_to_any[count.index]], 2)}"
}
