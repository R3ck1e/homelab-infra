resource "libvirt_volume" "vm_disk" {

  name = "${var.name}.qcow2"
  pool = "vm-disks"

  source = "/storage/templates/debian-12-cloud.qcow2"

  lifecycle {
    prevent_destroy = true
  }

}

resource "libvirt_cloudinit_disk" "cloudinit" {

  name = "${var.name}-cloudinit.iso"

  user_data = templatefile(
    "${path.module}/../../cloud-init/node.yaml.tpl",
    {
      hostname = var.name
      ip       = var.ip
      ssh_key  = var.ssh_key
    }
  )

  meta_data = <<EOF
instance-id: ${var.name}
local-hostname: ${var.name}
EOF

}

resource "libvirt_domain" "vm" {

  name   = var.name
  memory = 2048
  vcpu   = 2

  type = "kvm"

  disk {
    volume_id = libvirt_volume.vm_disk.id
  }

  network_interface {
    network_name = "homelab-net"
  }

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

}