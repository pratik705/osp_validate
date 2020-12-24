## OpenStack resource details
image_id        = "<GLANCE_IMAGE_ID>"
image_user_name = "<GLANCE_IMAGE_USER_NAME>"
ssh_public_key  = "<SSH_PUBLIC_KEY_PATH>"
ssh_private_key = "<SSH_PRIVATE_KEY_PATH>"

boot_from_volume = true
ticket_id        = "201120-05552"
instance_count   = 1
external_network = null

## Below are the extra parameters which you can override as per the requirement
## In order to override the parameter, uncomment and specify the value

## Ticket ID to append to the OSP resource. Default: 78293289
# ticket_id = "201120-05552"

## SSH private key if the instance is booted from image.
## It will be used to ssh the instance.
## Default: null
# ssh_private_key = "/home/stack/.ssh/id_rsa"

## SSH public key.
# ssh_private_key = "/home/stack/.ssh/id_rsa.pub"

## Glance image to use to boot the instance.
# image_id = "e109dbab-8057-4ab7-9ab6-05573b6d1772"

## Image user name to login the instance. Default: centos
# image_user_name: "centos"

## Specify the compute node[s] where you want to spawn an instance/instances in the list format.
## Format: "<availability_zone:compute_node>"
## Default: null
## NOTE:
##   - If "az_host" is commented(disabled) and "instance_count" => 1 then, nova-scheduler will select
##     the compute hosts.
##   - For 1-1 mapping of the instances and host, the "instance_count" variable value should match to the
##     number of hosts in "az_host" variable.
##   - If "instance_count contains higher count than the host specified in the "az_host", nova will
##     try to spawn instances on the first compute host from the "az_host" variable.

# az_host = ["nova:compute01-617163.localdomain", "compute03-716198.localdomain"]

## Prefix to the OSP resource. Default: rax
# prefix = "rax"

## Cinder volume size. Default: 10GB
# volume_size = 10

## Cinder volume type. Default: null
# volume_type = null

## Boot the instance from volume. Default: true
# boot_from_volume = true
