locals {
  cloudinit = templatefile("${path.module}/cloudinit.tpl", {
    hostname   = var.hostname
    username   = var.username
    ssh_key    = var.ssh_key
    ip_address = var.ip_address
  })
}

resource "proxmox_virtual_environment_file" "user_data" {
  content_type = "snippets"
  datastore_id = "DATA"         # Здесь должен быть storage, поддерживающий snippets
  node_name    = "server-home"
  source_raw   = local.cloudinit
}

resource "proxmox_virtual_environment_vm" "vm" {
  name        = var.hostname
  description = "Created by OpenTofu"
  vm_id       = var.vm_id
  node_name   = "server-home"

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    interface    = "scsi0"
    datastore_id = "DATA"
    file_id      = "101"  # здесь ID шаблона или iso
  }

  network_device {
    model  = "virtio"
    bridge = "vmbr0"
  }

  agent {
    enabled = true
  }

  operating_system {
    type = "cloud-init"
    user_data_file_id = proxmox_virtual_environment_file.user_data.id
  }
}
