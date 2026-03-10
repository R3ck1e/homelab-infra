data "libvirt_volume" "debian_template" {

  name = "debian-12-cloud.qcow2"
  pool = "templates"

}

resource "libvirt_volume" "disk" {

  name           = "${var.name}.qcow2"
  base_volume_id = data.libvirt_volume.debian_template.id

  pool   = "vm-disks"
  format = "qcow2"

}

resource "libvirt_cloudinit_disk" "cloudinit" {

  name = "${var.name}-cloudinit.iso"
  pool = "vm-disks"

  user_data = templatefile(
    "${path.module}/../../cloud-init/node.yaml.tpl",
    {
      hostname = var.name
      ip       = var.ip
      ssh_key  = var.ssh_key
    }
  )

}

resource "libvirt_domain" "vm" {

  name   = var.name
  memory = 4096
  vcpu   = 2

  network_interface {
    network_name = "homelab-net"
  }

  disk {
    volume_id = libvirt_volume.disk.id
  }

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

}