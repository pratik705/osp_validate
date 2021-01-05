output "instance_id" {
  value = var.boot_from_volume ? openstack_compute_instance_v2.instance_i1_volume[*].id : openstack_compute_instance_v2.instance_i1_image[*].id
}

output "instance_floating_ip" {
  value = var.external_network != null ? (var.boot_from_volume ? formatlist("%s = %s", openstack_compute_instance_v2.instance_i1_volume[*].name, openstack_networking_floatingip_v2.fip_1[*].address) : formatlist("%s = %s", openstack_compute_instance_v2.instance_i1_image[*].name, openstack_networking_floatingip_v2.fip_1[*].address)) : null
}

output "instance_ssh_user" {
  value = var.image_user_name
}
