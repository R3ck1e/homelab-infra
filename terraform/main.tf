<<<<<<< ours
<<<<<<< ours
locals {

  resolved_ssh_key = fileexists(pathexpand(var.ssh_public_key_path)) ? trimspace(file(pathexpand(var.ssh_public_key_path))) : trimspace(var.ssh_public_key)

  nodes = {

    control-1 = {
      ip   = "10.10.0.10"
      role = "control"
    }

    worker-1 = {
      ip   = "10.10.0.11"
      role = "worker"
    }

    worker-2 = {
      ip   = "10.10.0.12"
      role = "worker"
    }

  }

}

module "vm" {

  for_each = local.nodes

  source = "./modules/vm"

  name = each.key
  ip   = each.value.ip
  role = each.value.role

  ssh_key = local.resolved_ssh_key

  network_name    = var.network_name
  volume_pool     = var.volume_pool
  base_image_path = var.base_image_path
  memory_mib      = var.vm_memory_mib
  vcpu            = var.vm_vcpu

}
=======
terraform {
  required_version = ">= 1.0"
}
>>>>>>> theirs
=======
terraform {
  required_version = ">= 1.0"
}
>>>>>>> theirs
