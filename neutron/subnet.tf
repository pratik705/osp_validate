resource "openstack_networking_subnet_v2" "internal_subnet" {
  network_id = openstack_networking_network_v2.internal_network.id
  cidr       = var.network_cidr
  depends_on = [openstack_networking_network_v2.internal_network]
}