module "vm" {
  source = "./modules/vm"

  for_each = var.vms

  vm_id        = each.value.vm_id
  hostname     = each.value.hostname
  ip_address   = each.value.ip
  username     = each.value.username
  ssh_key      = file(var.ssh_key_path)
}
