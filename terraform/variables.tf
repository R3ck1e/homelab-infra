variable "ssh_public_key" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "libvirt_uri" {
  description = "Connection URI for the libvirt provider"
  type        = string
  default     = "qemu+ssh://terraform@100.110.30.13/system?keyfile=/home/github-runner/.ssh/github_vds"
}

variable "network_name" {
  description = "Libvirt network name for VM attachments"
  type        = string
  default     = "homelab-net"
}

variable "volume_pool" {
  description = "Libvirt storage pool used for VM disks and cloud-init images"
  type        = string
  default     = "vm-disks"
}

variable "base_image_path" {
  description = "Absolute path to the cloud image template on the hypervisor"
  type        = string
  default     = "/storage/templates/debian-12-cloud.qcow2"
}

variable "vm_memory_mib" {
  description = "Memory assigned to each VM in MiB"
  type        = number
  default     = 2048

  validation {
    condition     = var.vm_memory_mib >= 1024
    error_message = "vm_memory_mib must be at least 1024 MiB."
  }
}

variable "vm_vcpu" {
  description = "Number of vCPUs assigned to each VM"
  type        = number
  default     = 2

  validation {
    condition     = var.vm_vcpu >= 1
    error_message = "vm_vcpu must be at least 1."
  }
}
