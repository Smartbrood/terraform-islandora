variable "region" {
  description = "Digital Ocean Region"
  default = "fra1"
}

variable "size" {
  description = "Droplet Size"
  default = "s-1vcpu-3gb"
}

variable "public_key_path" {
  description = "Path to ssh rsa public key"
  default = "~/.ssh/id_rsa.pub"
}

