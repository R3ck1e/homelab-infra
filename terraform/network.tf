resource "libvirt_network" "homelab" {
  name      = "homelab-net"
  autostart = true

  bridge = {
    name = "virbr-homelab"
    stp  = "on"
  }

  domain = {
    name = "homelab.local"
  }

  forward = {
    mode = "nat"
  }

  ips = [
    {
      address = "10.10.0.1"
      netmask = "255.255.255.0"

      dhcp = {
        ranges = [
          {
            start = "10.10.0.100"
            end   = "10.10.0.200"
          }
        ]
      }
    }
  ]
}