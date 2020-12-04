/*
output "instance_id" {
  value = var.boot_from_volume ? openstack_compute_instance_v2.instance_i1_volume[0].id : openstack_compute_instance_v2.instance_i1_image[0].id
}

output "instance_floating_ip" {
  value = openstack_networking_floatingip_v2.fip_1.address
}

output "instance_ssh_user" {
  value = var.image_user_name
}
*/
