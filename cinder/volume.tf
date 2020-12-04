locals {
  volume_name = "${var.prefix}_volume_${var.random_id}"
}

resource "openstack_blockstorage_volume_v3" "create_volume" {
  name        = "${local.volume_name}_${count.index}"
  size        = var.volume_size
  volume_type = var.volume_type
  count       = var.boot_from_volume ? 0 : var.volume_count
}
