resource "libvirt_network" "homelab" {
  name = "homelab-net"

  mode = "nat"

  autostart = true

  addresses = [
    "10.10.0.0/24"
  ]

  dhcp {
    enabled = true
  }
}