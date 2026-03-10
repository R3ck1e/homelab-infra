locals {

  nodes = {
    control-1 = {
      ip = "10.10.0.10"
    }

    worker-1 = {
      ip = "10.10.0.11"
    }

    worker-2 = {
      ip = "10.10.0.12"
    }
  }

}

module "vm" {

  for_each = local.nodes

  source = "./modules/vm"

  name = each.key
  ip   = each.value.ip

  ssh_key = file(var.ssh_public_key)

}