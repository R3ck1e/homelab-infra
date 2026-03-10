resource "libvirt_volume" "vm_disk" {

  name = "${var.name}.qcow2"
  pool = var.volume_pool

  create = {
    content = {
      url = var.base_image_path
    }
  }

}

resource "libvirt_cloudinit_disk" "cloudinit" {

  name = "${var.name}-cloudinit.iso"

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
  memory_unit = "MiB"
  vcpu   = var.vcpu

  type = "kvm"

  os = {
    type = "hvm"
  }

  devices = {
    disks = [
      {
        source = {
          volume = {
            pool   = libvirt_volume.vm_disk.pool
            volume = libvirt_volume.vm_disk.name
          }
        }
        target = {
          dev = "vda"
          bus = "virtio"
        }
      },
      {
        device = "cdrom"
        source = {
          file = libvirt_cloudinit_disk.cloudinit.path
        }
        target = {
          dev = "sda"
          bus = "sata"
        }
      }
    ]

    interfaces = [
      {
        type = "network"
        source = {
          network = {
            network = var.network_name
          }
        }
        model = "virtio"
      }
    ]
  }
}
