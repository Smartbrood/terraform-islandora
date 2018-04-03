output "ami_id" {
  description = "AMI ID for Linux distribution"
  value       = "${data.null_data_source.values.outputs["${var.distribution}"]}"
}
