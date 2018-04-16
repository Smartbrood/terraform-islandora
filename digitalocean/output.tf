output "public_ip" {
  value = "${digitalocean_droplet.islandora.ipv4_address}"
}
