resource "azurerm_virtual_machine" "main" {
  for_each = toset(var.prefix)
  name                  = "${each.value}-vm"
  location              = "eastus"
  resource_group_name   = "eastus-rg"
  network_interface_ids = [var.network_interface_ids[each.value]]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name = "${each.value}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "hassan"
    # admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
    path     = "/home/hassan/.ssh/authorized_keys"
    key_data = file("~/.ssh/id_ed25519.pub")
  }
  }
  
  tags = {
    environment = "dev"
  }
}