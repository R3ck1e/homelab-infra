resource "libvirt_volume" "vm_disk" {

  name = "${var.name}.qcow2"
  pool = var.volume_pool

  source = var.base_image_path

}

resource "libvirt_cloudinit_disk" "cloudinit" {

  name = "${var.name}-cloudinit.iso"
  pool = var.volume_pool

  user_data = templatefile("${path.module}/../../cloud-init/node.yaml.tpl", {
    hostname = var.name
    ip       = var.ip
    role     = var.role
    ssh_key  = var.ssh_key
  })

  meta_data = <<EOF
instance-id: ${var.name}
local-hostname: ${var.name}
EOF

}

resource "libvirt_domain" "vm" {

  name   = var.name
  memory = var.memory_mib
  vcpu   = var.vcpu

  type = "kvm"

  disk {
    volume_id = libvirt_volume.vm_disk.id
  }

  network_interface {
    network_name = var.network_name
  }

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

}
