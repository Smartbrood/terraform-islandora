variable "environment" {
  description = "Name for environment."
}

variable "pet_name" {
  description = "Random name - used as part of ec2_iam_role name."
}

variable "tags" {
  description = "Map with tags."
  type = "map"
}

variable "ami_update" {
  description = "Auto discover latest ami id."
  default     = "false"
}

variable "ami" {
  description = "ami id"
  default     = ""
}

variable "security_group" {
  description = "The ID of security group."
}

variable "instance_type" {
  description = "EC2 instance type."
}

variable "key_name" {
  description = "The ssh key name for EC2 instances."
}

variable "count_public_a" {
  description = "Number of EC2 instances in public subnet in aviability zone a."
  default     = "0"
}

variable "count_public_b" {
  description = "Number of EC2 instances in public subnet in aviability zone b."
  default     = "0"
}

variable "count_public_c" {
  description = "Number of EC2 instances in public subnet in aviability zone c."
  default     = "0"
}

variable "subnet_public_zone_a" {
  description = "The ID of public subnet in aviability zone a."
}

variable "subnet_public_zone_b" {
  description = "The ID of public subnet in aviability zone b."
}

variable "subnet_public_zone_c" {
  description = "The ID of public subnet in aviability zone c."
}
