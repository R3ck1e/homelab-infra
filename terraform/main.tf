locals {
  network = {
    name   = "homelab-net"
    cidr   = "10.10.0.0/24"
    bridge = "virbr-homelab"
    domain = "homelab.local"
  }
}
