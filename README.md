# osp_validate
Validate the OSP environment by creating a test resources

One can use this terraform code to validate the working of existing OpenStack environment. The state of the OpenStack environment will be validated by creating following OpenStack resources:

  - Neutron network 
  - Neutron subnet
  - Neutron router
  - Keypair
  - Security group
  - Floating IP
  - Cinder volume
  - Nova instance
---

## Usage:
- Install terraform(>= 0.13)
  - https://learn.hashicorp.com/tutorials/terraform/install-cli 
- Clone the git repository:  
```
$ git clone https://github.com/pratik705/osp_validate.git
$ cd osp_validate
```
- source the `overcloudrc/openrc`. For more information you can [this](https://docs.openstack.org/keystone/victoria/install/keystone-openrc-rdo.html) link. Terraform will create the OSP resources in the project specified in the overcloudrc/openrc file.  
- Set appropriate variables specific to your OpenStack environment in [terraform.tfvars](https://github.com/pratik705/osp_validate/blob/main/terraform.tfvars) file.

| Variable          | Description                                                                    | Default          | Required  |
|-------------------|--------------------------------------------------------------------------------|------------------|-----------|
| image_id          | Glance image ID to use to boot the instance                                    | None             |Yes        |
| ssh_public_key    | Absolute path of the ssh public key to create keypair                          | None             |Yes        |
| ssh_private_key   | Absolute path of the ssh private key to access the instance once its created   | None             |Yes        |
| image_user_name   | Image user name to login the instance                                          | centos           |No         |
| external_network  | Name of the external/floating network to which instance will be attached<br>**NOTE:**<br>&nbsp;&nbsp;&nbsp;- If unset, instance will be created without floating IP.      | None             |No         |
| boot_from_volume  | Boot the instance from volume                                                  | true             |No         |
| ticket_id         | Ticket ID to append to the OSP resource                                        | 201120-05552     |No         |
| instance_count    | Number of instances to boot                                                    | 1                |No         |
| prefix            | Prefix to the OSP resource                                                     | rax              |No         |
| az_host           | The compute node where you want to spawn an instance.<br>Format: `["<availability_zone:compute_node>"]`<br>**NOTE:**<br>&nbsp;&nbsp;&nbsp;- If `az_host` is commented(disabled) and `instance_count => 1` then, nova-scheduler will select the compute hosts.<br>&nbsp;&nbsp;&nbsp; - For **1-1 mapping of the instance and host**, the `instance_count` variable value should match to the number of hosts in `az_host` variable. <br> &nbsp;&nbsp;&nbsp; - If `instance_count` contains higher count than the hosts specified in the `az_host`, nova will try to spawn instances on the first compute host from the `az_host` variable.    | null             |No        |
| volume_size       | Size(in GB) of the cinder volume to be created                                 | 10               |No         |
| volume_type       | Cinder volume type to create volume on specific backend                        | null             |No         |

- Create OpenStack resources: 
```
[stack@osp osp_validate]$ source ~/openrc
(openrc) [stack@osp osp_validate]$ terraform init
(openrc) [stack@osp osp_validate]$ terraform plan
(openrc) [stack@osp osp_validate]$ terraform apply
```

- 
- Show instance details(after `terraform apply`):
```
(openrc) [stack@osp osp_validate]$ terraform output
``` 
- Sample output:
```
(openrc) [stack@osp osp_validate]$ terraform output
instance_id = [
  "51a4158a-6e09-4cb3-8067-1dd11022fcf5",
  "157bd9d5-6f09-4d55-9175-d97db38ae912",
  "c55cc40d-0e2f-448d-936e-fff4e66a7642",
]
instance_name-floating_ip = [
  "rax_instance_201120-05558_0 = 172.23.232.164",
  "rax_instance_201120-05558_1 = 172.23.232.134",
  "rax_instance_201120-05558_2 = 172.23.232.121",
]
instance_ssh_user = centos
```
- Destroy OpenStack resources:
```
(openrc) [stack@osp osp_validate]$ terraform destroy
```
---

## Notes:
- If `boot_from_volume` is set to `false` then, instance will be created with nova ephemeral disk and cinder volume will be attached to the instance. The volume will be formated using `xfs` filesystem and mounted to `/mnt`. Further test file will be created to validate if the volume is writable.
- Once `terraform apply` is completed, you can access the instance using username and instance floating IP from the output.
---
## Demo:
[![asciicast](https://asciinema.org/a/CF7p4zGNON6PiduhkS7BcCXNy.svg)](https://asciinema.org/a/CF7p4zGNON6PiduhkS7BcCXNy)
