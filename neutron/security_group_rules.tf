data "openstack_networking_secgroup_v2" "sec_group" {
  secgroup_id = openstack_networking_secgroup_v2.sec_group.id
  depends_on  = [openstack_networking_secgroup_v2.sec_group]

}

resource "openstack_networking_secgroup_rule_v2" "sec_group_rules" {
  for_each          = var.sec_group_rule_target_ports
  direction         = "ingress"
  ethertype         = "IPv4"
  security_group_id = data.openstack_networking_secgroup_v2.sec_group.id
  port_range_min    = each.key
  port_range_max    = each.key
  protocol          = each.value
  remote_ip_prefix  = var.remote_ip
}