variable "vm_id" {
  description = "Уникальный VMID в Proxmox"
  type        = number
}

variable "hostname" {
  description = "Имя хоста"
  type        = string
}

variable "ip_address" {
  description = "Статический IP-адрес"
  type        = string
}

variable "username" {
  description = "Имя пользователя, создаваемого через cloud-init"
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH-ключ для cloud-init"
  type        = string
}
