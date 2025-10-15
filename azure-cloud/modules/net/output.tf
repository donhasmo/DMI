output "public_ips" {
  description = "Public IP addresses of all VMs"
  value = {
    for k, pip in azurerm_public_ip.main : k => pip.ip_address
  }
}

output "network_interface_ids" {
  value = { for k, nic in azurerm_network_interface.main : k => nic.id }
}