variable "prefix" {
  default = "rax"
}

variable "random_id" {
  description = "Random ID / ticket ID to append to the OSP resource"
  default     = "201120-05552"
  type        = string
}

variable "tenant_id" {
  description = "OSP project to use"
}

variable "image_id" {
  description = "Glance image to use to boot the instance"
}

variable "image_user_name" {
  description = "Image user name to login the instance"
  default     = "centos"
}

variable "ssh_public_key" {
  description = "Absolute path of the ssh public key"
}

variable "ssh_private_key" {
  description = "Absolute path of the ssh private key"
  default     = null
}

variable "ram" {
  description = "The amount of RAM to use, in megabytes"
  default     = 30000
  type        = number
}

variable "disk" {
  description = "The amount of disk space in gigabytes to use for the root (/) partition"
  default     = 50
  type        = number
}

variable "vcpus" {
  description = "The number of virtual CPUs to use"
  default     = 20
  type        = number
}

variable "boot_from_volume" {
  description = "Boot the instance from volume"
  default     = false
  type        = bool
}

variable "volume_size" {
  description = "Cinder volume size for bootable disk"
  default     = 10
  type        = number
}

variable "volume_type" {
  description = "Volume type"
  default     = null
}

variable "az_host" {
  description = "Compute host to spawn an instance. Format: az:host"
  default     = null
  type        = string
}

variable "instance_count" {
  description = "Number of instances to spawn"
  default     = 1
  type        = number
}

variable "unique_host" {
  description = "Unique host to boot an instance. NOTE: Instance count must match to the number of hosts defined in 'az_host'"
  default = false
  type = bool
}