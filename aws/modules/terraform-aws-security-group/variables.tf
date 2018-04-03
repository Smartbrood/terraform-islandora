variable "rules" {
  description = "Map of security group rules, defined as 'name' = ['from port', 'to port', 'protocol', 'description'])"
  type        = "map"

  default = {
    any             = [0, 0, "-1", "ANY"]
    icmp            = ["-1", "-1", "icmp", "ICMP"]
    ssh-22-tcp      = [22, 22, "tcp", "HTTP"]
    http-80-tcp     = [80, 80, "tcp", "HTTP"]
    https-443-tcp   = [443, 443, "tcp", "HTTPS"]
    ldap-389-tcp    = [389, 389, "tcp", "HTTP"]
    mysql-3306-tcp  = [3306, 3306, "tcp", "MYSQL"]
  }
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
}

variable "name" {
  description = "Name of security group"
}

variable "description" {
  description = "Description of security group"
  default     = "Security Group managed by Terraform"
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  default     = {}
}

variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  default     = []
}

variable "ingress_rules_from_any" {
  description = "List of ingress rules to create by name from 0.0.0.0/0"
  default     = []
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  default     = []
}

variable "egress_rules" {
  description = "List of egress rules to create by name"
  default     = []
}

variable "egress_rules_to_any" {
  description = "List of egress rules to create by name to 0.0.0.0/0"
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  default     = []
}

