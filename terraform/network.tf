resource "libvirt_network" "homelab" {

  name = "homelab-net"
  mode = "nat"
  domain = "homelab.local"
  addresses = [
    "10.10.0.0/24"
  ]
 
}