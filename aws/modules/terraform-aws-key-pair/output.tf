output "key_name" {
  description = "SSH key name"
  value = "${aws_key_pair.this.key_name}"
}
