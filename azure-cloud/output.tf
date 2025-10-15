output "vm_public_ips" {
  description = "Public IP addresses for each VM"
  value       = module.net.public_ips
}