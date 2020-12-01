module "nova" {
  source = "./nova"
  image_id = var.image_id
  ssh_public_key = var.ssh_public_key
  ssh_private_key = var.ssh_private_key
  tenant_id = var.tenant_id
  boot_from_volume = var.boot_from_volume
  image_user_name = var.image_user_name
  volume_size = var.volume_size
  az_host = var.az_host
  random_id = var.ticket_id
}