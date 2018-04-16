terraform {
    version    = "1.0.2"
}

# export DIGITALOCEAN_TOKEN=

provider "digitalocean" {
    version    = "0.1.3"
}

provider "null" {
    version    = "1.0.0"
}

resource "digitalocean_ssh_key" "default" {
    name       = "Default SSH key"
    public_key = "${file(var.public_key_path)}"
}

data "digitalocean_image" "islandora" {
  name = "islandora-1.0.0"
}

resource "digitalocean_droplet" "islandora" {
    image  = "${data.digitalocean_image.islandora.image}"
    #image  = "ubuntu-16-04-x64"
    name   = "islandora"
    region = "${var.region}"
    size   = "${var.size}"
    ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
    tags   = ["${digitalocean_tag.islandora.id}"]
}

resource "digitalocean_tag" "islandora" {
    name = "islandora"
}



