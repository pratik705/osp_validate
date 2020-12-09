locals {
  sec_group_name = "${var.prefix}_sec_group_${var.random_id}"
}

resource "openstack_networking_secgroup_v2" "sec_group" {
  name        = local.sec_group_name
  description = var.sec_group_description
}
