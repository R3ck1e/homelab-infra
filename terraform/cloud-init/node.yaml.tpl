#cloud-config

hostname: ${hostname}

users:
  - name: admin
    groups: sudo
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - ${ssh_key}

package_update: true
package_upgrade: true

write_files:
  - path: /etc/netplan/50-cloud-init.yaml
    permissions: '0644'
    content: |
      network:
        version: 2
        ethernets:
          eth0:
            dhcp4: false
            addresses:
              - ${ip}/24
            gateway4: 10.10.0.1
            nameservers:
              addresses: [1.1.1.1,8.8.8.8]

runcmd:
  - netplan apply