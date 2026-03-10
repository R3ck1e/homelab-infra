
resource "libvirt_network" "homelab" {
  name = "homelab-net"

  addresses = ["10.10.0.0/24"]

  dns {
    enabled = true
    local_only = false
  }

}
