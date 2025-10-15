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









