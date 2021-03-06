resource "aws_volume_attachment" "this" {
  count = var.instance_count

  device_name = var.device_name
  volume_id   = aws_ebs_volume.this[count.index].id
  instance_id = element(
    distinct(compact(var.instance_ids)),
  count.index)
  force_detach = var.force_detach

}

resource "aws_ebs_volume" "this" {
  count = var.instance_count

  availability_zone = element(
    distinct(compact(var.availability_zones)),
  count.index)
  encrypted = var.encrypted
  size      = var.volume_size
  type      = var.volume_type
  iops      = var.volume_type == "io1" || var.volume_type == "io2" ? var.volume_iops : null

  tags = merge(
    {
      "Name"        = format("${var.name}-%s", count.index + 1)
    },
    var.tags
  )
}