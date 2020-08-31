resource "aws_volume_attachment" "this" {
  count = var.instance_count

  device_name = var.device_name
  volume_id   = aws_ebs_volume.this[count.index].id
  instance_id = element(
    distinct(compact(var.instance_id)),
  count.index, )
  force_detach = var.force_detach

}

resource "aws_ebs_volume" "this" {
  count = var.instance_count

  availability_zone = element(
    distinct(compact(var.availability_zone)),
  count.index, )
  encrypted = var.encrypted
  size      = var.volume_size
  type      = var.volume_type
  iops      = var.volume_iops

  tags = merge(
    {
      "Name"        = format("${var.project}-${var.name}-0%s", count.index + 1)
      "Environment" = var.environment
      "Terraform"   = "true"
    },
    var.tags
  )
}