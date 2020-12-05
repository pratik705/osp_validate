## OpenStack environment details for authentication
osp_auth_url      = "<OS_AUTH_URL>"
osp_region        = "<OS_REGION_NAME>"
osp_user_name     = "<OS_USERNAME>"
osp_user_password = "<OS_PASSWORD>"
tenant_id         = "<OS_PROJECT_ID>"

## OpenStack resource details
image_id        = "<GLANCE_IMAGE_ID>"
image_user_name = "<GLANCE_IMAGE_USER_NAME>"
ssh_public_key  = "<SSH_PUBLIC_KEY_PATH>"
ssh_private_key = "<SSH_PRIVATE_KEY_PATH>"

boot_from_volume = true
ticket_id        = "201120-05552"
instance_count   = 1

## Below are the extra parameters which you can override as per the requirement
## In order to override the parameter, uncomment and specify the value

## Tenant/project ID in which resource should be created
# tenant_id = "bbd381a60b044783a32887030e9c6fbe"

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

## Spawn instance on the unique host.
## NOTE: Instance count must match to the number of hosts defined in "az_host"
unique_host = true

## Specify the compute node where you want to spawn an instance.
## Format: "<availability_zone:compute_node>"
## Default: null
# az_host = ["nova:compute01-617163.localdomain"]

## Prefix to the OSP resource. Default: rax
# prefix = "rax"

## Cinder volume size. Default: 10GB
# volume_size = 10

## Cinder volume type. Default: null
# volume_type = null

## Boot the instance from volume. Default: true
# boot_from_volume = true
