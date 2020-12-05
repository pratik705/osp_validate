output "instance_id" {
  value = module.nova.instance_id
}

output "instance_name-floating_ip" {
  value = module.nova.instance_floating_ip
}

output "instance_ssh_user" {
  value = module.nova.instance_ssh_user
}
