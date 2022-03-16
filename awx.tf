provider "awx" {
  hostname = "http://172.31.18.170"
  username = "admin"
  password = "password"
}


resource "awx_host" "k3snode1" {
  name         = "cart"
  description  = "cart"
  inventory_id = 3
  group_ids    = []
  enabled      = true
  variables    = <<YAML
---
ansible_host: 192.168.178.29
YAML
}
