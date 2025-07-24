#cloud-config
hostname: ${hostname}
users:
  - name: ${username}
    ssh-authorized-keys:
      - ${ssh_key}
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
network:
  version: 2
  ethernets:
    ens18:
      dhcp4: false
      addresses: [${ip_address}/27]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8]
