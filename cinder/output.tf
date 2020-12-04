output "volume_id" {
  value = var.boot_from_volume ? null : openstack_blockstorage_volume_v3.create_volume[*].id
}
