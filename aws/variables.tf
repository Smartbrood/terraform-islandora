variable "region" {
  description = "AWS Region"
  default = "eu-west-1"
}

variable "public_key_path" {
  description = "Path to ssh rsa public key"
  default = "~/.ssh/id_rsa.pub"
}

variable "environment" {
  description = "Name for environment."
  default = "stage"
}

variable "tags" {
  default = {
    Repository  = "terraform-islandora"
    Terraform   = "true"
  }
}

