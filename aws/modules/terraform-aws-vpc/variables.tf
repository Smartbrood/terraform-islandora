variable "region" { 
  description = "The AWS region."
}

variable "enable_dns_hostnames" { 
  default = true 
  description = "Enable dns hostnames for VPC."
}

variable "enable_dns_support" { 
  default = true 
  description = "Enable dns support for VPC."
}

variable "map_public_ip_on_launch" { 
  default = true 
  description = "Map public ip on launch in public subnets."
}

variable "vpc_cidr" { 
  description = "The CIDR ip addresses block for VPC."
}

variable "public_subnet_a" { 
  description = "The CIDR ip addresses block for public subnet in zone a."
}

variable "public_subnet_b" { 
  description = "The CIDR ip addresses block for public subnet in zone b."
}

variable "public_subnet_c" { 
  description = "The CIDR ip addresses block for public subnet in zone c."
}

variable "private_subnet_a" { 
  description = "The CIDR ip addresses block for private subnet in zone a."
}

variable "private_subnet_b" { 
  description = "The CIDR ip addresses block for private subnet in zone b."
}

variable "private_subnet_c" { 
  description = "The CIDR ip addresses block for private subnet in zone c."
}

variable "tags" {
  type = "map"
  default = {
    Terraform   = "true"
  }
}
