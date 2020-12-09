variable "prefix" {
  default = "rax"
}

variable "random_id" {
  description = "Random ID / ticket ID to append to the OSP resource"
  default     = "201120-05552"
  type        = string
}

variable "network_cidr" {
  default = "192.168.100.0/24"
}

variable "sec_group_description" {
  type    = string
  default = "Security group"
}

variable "sec_group_rule_target_ports" {
  type = map(any)
  default = {
    "22" = "tcp"
    "80" = "tcp"
  }
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "remote_ip" {
  type    = any
  default = "0.0.0.0/0"
}
