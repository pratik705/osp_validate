variable "osp_auth_url" {
  description = "OSP authentication URL"
  type        = string
}

variable "osp_region" {
  description = "OSP region"
  type        = string
}

variable "osp_user_name" {
  description = "User name to use for OSP authentication"
  type        = string
}

variable "osp_user_password" {
  description = "User password to use for OSP authentication"
  type        = string
}

variable "tenant_id" {
  description = "OSP project to use"
  type        = string
}

variable "ticket_id" {
  description = "Random ID / ticket ID to append to the OSP resource"
  default     = "201120-05552"
  type        = string
}

variable "prefix" {
  description = "Prefix to the OSP resource"
  default     = "rax"
  type        = string
}
variable "image_id" {
  description = "Glance image to use to boot the instance"
}

variable "ssh_public_key" {
  description = "Absolute path of the ssh public key"
}

variable "ssh_private_key" {
  description = "Absolute path of the ssh private key"
  default     = null
}

variable "boot_from_volume" {
  description = "Boot the instance from volume"
  default     = false
  type        = bool
}

variable "image_user_name" {
  description = "SSH username to access the instance"
  default     = "centos"
}

variable "volume_type" {
  description = "Cinder volume type"
  default     = null
}

variable "volume_size" {
  description = "Cinder volume size"
  default     = 10
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

variable "volume_count" {
  description = "Number of volumes"
  default     = 1
  type        = number
}

variable "unique_host" {
  description = "Unique host to boot an instance. NOTE: Instance count must match to the number of hosts defined in 'az_host'"
  default = false
  type = bool
}
