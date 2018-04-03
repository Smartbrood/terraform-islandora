terraform {
    version    = "1.0.2"
}

provider "aws" {
    version    = "0.1.3"
    region     = "${var.region}"
}

provider "null" {
    version    = "1.0.0"
}

provider "random" {
    version    = "1.1.0"
}

module "key-pair" {
    source          = "./modules/terraform-aws-key-pair"
    public_key_path = "${var.public_key_path}"
}

resource "random_pet" "this" {
    length = "1"
}

module "vpc" {
    source           = "./modules/terraform-aws-vpc"
    region           = "${var.region}"
    vpc_cidr         = "10.3.0.0/16"
    public_subnet_a  = "10.3.1.0/24"
    public_subnet_b  = "10.3.2.0/24"
    public_subnet_c  = "10.3.3.0/24"
    private_subnet_a = "10.3.4.0/24"
    private_subnet_b = "10.3.5.0/24"
    private_subnet_c = "10.3.6.0/24"
    tags = "${merge(var.tags, map("Name", "${var.environment}-${random_pet.this.id}", "Environment", "${var.environment}"))}"
}

module "security_group" {
    source      = "./modules/terraform-aws-security-group"
    name        = "${var.environment}-${random_pet.this.id}"
    description = "For Islandora EC2 instance"
    vpc_id      = "${module.vpc.values["vpc"]}"
    tags = "${merge(var.tags, map("Name", "${var.environment}-${random_pet.this.id}"))}"
    ingress_rules_from_any  = ["ssh-22-tcp", "https-443-tcp", "http-80-tcp"]
    egress_rules_to_any     = ["ssh-22-tcp", "https-443-tcp", "http-80-tcp"]
    ingress_rules           = ["any"]
    ingress_cidr_blocks     = ["${module.vpc.values["vpc_cidr_block"]}"]
    egress_rules            = ["any"]
    egress_cidr_blocks      = ["${module.vpc.values["vpc_cidr_block"]}"]
}

module "ec2_iam_role_islandora" {
  source                = "./modules/terraform-aws-ec2-iam-role"
  name                  = "terraform-inslandora-${random_pet.this.id}"
  path                  = "/"
  description           = "This IAM Role generated by Terraform."
  force_detach_policies = false

  policy_arn = [
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
  ]
}

module "ubuntu1604" {
  source                = "./modules/terraform-aws-data-ami"
  distribution          = "ubuntu1604"
}

module "ec2_islandora" {
  source                      = "./modules/terraform-aws-ec2-instance"
  name                        = "islandora-${random_pet.this.id}"
  count                       = "1"
  ami                         = "${module.ubuntu1604.ami_id}"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.this.key_name}"
  iam_instance_profile        = "${module.ec2_iam_role_islandora.profile_name}"
  subnet_id                   = "${data.terraform_remote_state.root.network_values["subnet_infrastructure_public_zone_a"]}"
  vpc_security_group_ids      = ["${module.security_group.id}"]
  associate_public_ip_address = true
  monitoring                  = false

  tags = "${var.tags}"
}
