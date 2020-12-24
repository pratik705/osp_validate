module "neutron" {
  source    = "../neutron"
  prefix    = var.prefix
  random_id = var.random_id
  external_network = var.external_network
}

module "cinder" {
  source           = "../cinder"
  boot_from_volume = var.boot_from_volume
  prefix           = var.prefix
  random_id        = var.random_id
  volume_size      = var.volume_size
  volume_type      = var.volume_type
  volume_count     = var.instance_count
}
locals {
  instance_name = "${var.prefix}_instance_${var.random_id}"
  unique_host   = try((var.instance_count == length(var.az_host)), false)
  single_host   = try((length(var.az_host) == 1), false)
}

resource "openstack_compute_instance_v2" "instance_i1_image" {
  name              = "${local.instance_name}_${count.index}"
  image_id          = var.image_id
  flavor_id         = openstack_compute_flavor_v2.compute_flavor.id
  key_pair          = openstack_compute_keypair_v2.keypair_k1.id
  security_groups   = [module.neutron.security_group_id]
  availability_zone = local.unique_host ? var.az_host[count.index] : (local.single_host ? var.az_host[0] : null)
  network {
    uuid = module.neutron.internal_network_id
  }
  count = var.boot_from_volume ? 0 : var.instance_count
}

resource "openstack_compute_instance_v2" "instance_i1_volume" {
  name              = "${local.instance_name}_${count.index}"
  flavor_id         = openstack_compute_flavor_v2.compute_flavor.id
  key_pair          = openstack_compute_keypair_v2.keypair_k1.id
  security_groups   = [module.neutron.security_group_id]
  availability_zone = local.unique_host ? var.az_host[count.index] : (local.single_host ? var.az_host[0] : null)

  network {
    uuid = module.neutron.internal_network_id
  }
  block_device {
    uuid                  = var.image_id
    source_type           = "image"
    volume_size           = var.volume_size
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
  count = var.boot_from_volume ? var.instance_count : 0
}

resource "openstack_networking_floatingip_v2" "fip_1" {
  pool  = var.external_network != null ? var.external_network : null
  count = var.external_network != null ? var.instance_count : 0
}

resource "openstack_compute_floatingip_associate_v2" "fip_image" {
  floating_ip = openstack_networking_floatingip_v2.fip_1[count.index].address
  instance_id = openstack_compute_instance_v2.instance_i1_image[count.index].id
  count       = var.external_network != null ? (var.boot_from_volume ? 0 : var.instance_count) : 0
}

resource "openstack_compute_floatingip_associate_v2" "fip_volume" {
  floating_ip = openstack_networking_floatingip_v2.fip_1[count.index].address
  instance_id = openstack_compute_instance_v2.instance_i1_volume[count.index].id
  count       = var.external_network != null ? (var.boot_from_volume ? var.instance_count : 0) : 0
}

resource "openstack_compute_volume_attach_v2" "attach_volume" {
  instance_id = openstack_compute_instance_v2.instance_i1_image[count.index].id
  volume_id   = module.cinder.volume_id[count.index]
  count       = var.boot_from_volume ? 0 : var.instance_count
  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo mkfs.xfs /dev/vdb",
      "sudo mount /dev/vdb /mnt",
      "sudo touch /mnt/test_file.txt"
    ]

//    connection {
//      timeout     = "2m"
//      host        = openstack_networking_floatingip_v2.fip_1[count.index].address
//      user        = var.image_user_name
//      private_key = var.ssh_private_key != null ? file(var.ssh_private_key) : null
//    }
  }
}

