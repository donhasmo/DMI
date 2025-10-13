resource "azurerm_storage_account" "tf_storage_account" {
  name                     = "tfstorageaccountdemo"
  resource_group_name      = "eastus-rg"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  # provider = azurerm.eastus

  tags = {
    location = "eastus"
  }
}

# resource "azurerm_storage_account" "westeurope_storage_account" {
#   name                     = "westeustorageaccountname"
#   resource_group_name      = azurerm_resource_group.westeurope_resource_group.name
#   location                 = azurerm_resource_group.westeurope_resource_group.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
#   provider = azurerm.westeurope

#   tags = {
#     location = "westeurope"
#   }
# }