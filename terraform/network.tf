resource "libvirt_network" "homelab" {
  name      = "homelab-net"
  autostart = true

  xml = <<EOF
<network>
  <name>homelab-net</name>
  <forward mode='nat'/>
  <bridge name='virbr-homelab' stp='on' delay='0'/>
  <ip address='10.10.0.1' netmask='255.255.255.0'/>
</network>
EOF
}