locals {
  this_volume_id   = coalescelist(aws_ebs_volume.this.*.id, [""])
  this_instance_id = coalescelist(aws_volume_attachment.this.*.instance_id, [""])
}

output "instance_id" {
  description = "List of instances IDs"
  value       = local.this_instance_id
}

output "volume_id" {
  description = "List of Volume IDs"
  value       = local.this_volume_id
}

output "device_name" {
  description = "The device name exposed to the instance"
  value       = var.instance_count == 0 ? "" : aws_volume_attachment.this.*.device_name
}