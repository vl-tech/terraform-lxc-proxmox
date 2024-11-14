terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://local_server_ip:8006/api2/json"
  pm_log_enable = true
  pm_debug      = true

}

resource "proxmox_lxc" "basic" {
  count = 3
  vmid = 200 + count.index
  target_node  = "proxmox"
  hostname     = "lxc-container-name"
  ostemplate   = "local:vztmpl/ubuntu-23.10-standard_23.10-1_amd64.tar.zst"
  password     = "Container Password for root"
  unprivileged = true
  memory = 1024
  cpulimit = 1
  start = true
  ssh_public_keys = "your Public Key to import to the LXC container"

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }


}

