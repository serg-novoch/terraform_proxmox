variable "vms" {
  type = map(object({
    wm_id     = number
    ip        = string
    hostname  = string
    username = string
  }))
}

variable "ssh_key_path" {
  default = "~/.ssh/server-home.pub"
}

variable "virtual_environment_endpoint" {
  type        = string
  default = "https://ip_server_proxmox:8006"
}
variable "virtual_environment_token" {
  type        = string
  default = "root@pam!user=your_api_key"
}

