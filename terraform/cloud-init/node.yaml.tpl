#cloud-config

hostname: ${hostname}
manage_etc_hosts: true

users:
  - name: admin
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - ${ssh_key}

package_update: true
package_upgrade: true

write_files:
  - path: /etc/netplan/50-cloud-init.yaml
    content: |
      network:
        version: 2
        ethernets:
          ens3:
            dhcp4: false
            addresses:
              - ${ip}/24
            gateway4: 10.10.0.1
            nameservers:
              addresses: [1.1.1.1, 8.8.8.8]

runcmd:
  - netplan apply
