<<<<<<< ours
<<<<<<< ours
variable "name" {
  type = string
}

variable "ip" {
  type = string

  validation {
    condition     = can(cidrhost("${var.ip}/24", 0))
    error_message = "ip must be a valid IPv4 address."
  }
}

variable "role" {
  type = string

  validation {
    condition     = contains(["control", "worker"], var.role)
    error_message = "role must be either control or worker."
  }
}

variable "ssh_key" {
  type = string
}

variable "network_name" {
  type = string
}

variable "volume_pool" {
  type = string
}

variable "base_image_path" {
  type = string
}

variable "memory_mib" {
  type = number
}

variable "vcpu" {
  type = number
}
=======
>>>>>>> theirs
=======
>>>>>>> theirs
