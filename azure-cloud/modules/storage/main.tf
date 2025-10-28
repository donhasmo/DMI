resource "azurerm_storage_account" "tf_storage_account" {
  name                     = "tfstorageaccountdemo"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  # provider = azurerm.eastus

  tags = {
    location = "eastus"
  }
}
