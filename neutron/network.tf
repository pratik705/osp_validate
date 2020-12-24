locals {
  network_name = "${var.prefix}_network_${var.random_id}"
}

data "openstack_networking_network_v2" "get_external_network" {
  name = var.external_network
  count = var.external_network != null ? 1 : 0
}

resource "openstack_networking_network_v2" "internal_network" {
  name      = local.network_name
}
