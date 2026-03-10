terraform {
  required_version = ">= 1.14.0"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.7"
    }
  }
}

provider "libvirt" {
  uri = "qemu+ssh://terraform@100.110.30.13/system"
}