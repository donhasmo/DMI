# locals {
  
# }

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e0016351-6fec-419f-898c-796cbdf2c69c"
  use_cli = true
}

module "net" {
  source = "./modules/net"
  prefix = var.prefix 
}

module "vm" {
  source = "./modules/vm"
  prefix = var.prefix  
  network_interface_ids = module.net.network_interface_ids
  public_ips         = module.net.public_ips
}

# resource "null_resource" "ansible_provision" {
#   triggers = {
#     web_ip      = values(module.net.public_ips)[0]
#   }

#   provisioner "local-exec" {
#     command = <<-EOT
#       echo "[INFO] Exporting Terraform outputs for Ansible..."
#       terraform output -json > ../static-web/group_vars/web.json

#       echo "[web]" > ../epicbook/inventory.ini
#       echo "$(terraform output -raw public_ip) ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_ed25519" >> ../static-web/inventory.ini


#       echo "[INFO] Running Ansible playbook..."
#       cd ../epicbook
#       ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.ini site.yml
#     EOT

#     interpreter = ["/bin/bash", "-c"]
#   }

#   depends_on = [
#     module.vm
#   ]
# }









