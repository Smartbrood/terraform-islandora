variable "key_name_prefix" {
  description = "Key name prefix for ssh rsa public key"
  default = "terraform-"
}

variable "public_key_path" {
  description = "Path to ssh rsa public key"
  default = "~/.ssh/id_rsa.pub"
}
