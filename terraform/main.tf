locals {
  vm_admin_ssh_public_key = trimspace(
    fileexists(pathexpand(var.ssh_public_key_path))
    ? file(pathexpand(var.ssh_public_key_path))
    : var.ssh_public_key
  )

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

  ssh_key = local.vm_admin_ssh_public_key

  network_name           = var.network_name
  volume_pool            = var.volume_pool
  template_volume_path   = var.template_volume_path
  vm_disk_capacity_bytes = var.vm_disk_capacity_bytes
  memory_mib             = var.vm_memory_mib
  vcpu                   = var.vm_vcpu
}
