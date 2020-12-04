variable "prefix" {
  default = "rax"
}

variable "random_id" {
  description = "Random ID / ticket ID to append to the OSP resource"
  default     = "201120-05552"
  type        = string
}

variable "volume_size" {
  description = "Volume size"
  type        = number
  default     = 10
}

variable "volume_type" {
  description = "Volume type"
  default     = null
}

variable "boot_from_volume" {
  description = "Boot the instance from volume"
  default     = false
  type        = bool
}

variable "volume_count" {
  description = "Number of volumes"
  default = 1
  type = number
}
