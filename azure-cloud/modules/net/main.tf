resource "azurerm_virtual_network" "main" {
  # for_each = toset(var.prefix)
  name                = "network"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
}

resource "azurerm_subnet" "internal" {
  # for_each             = toset(var.prefix)
  name                 = "internal"
  resource_group_name  = "eastus-rg"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "main" {
  for_each = toset(var.prefix)
  name                = "${each.value}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"

  ip_configuration {
    name                          = "testconfiguration1-${each.value}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main[each.value].id
  }
}

resource "azurerm_public_ip" "main" {
  for_each            = toset(var.prefix)
  name                = "${each.value}-publicip"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_security_group" "main" {
  for_each = toset(var.prefix)

  name                = "${each.value}-nsg"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 1010
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "80"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }

  tags = {
    environment = "dev"
  }
}

resource "azurerm_network_interface_security_group_association" "main" {
  for_each = toset(var.prefix)

  network_interface_id      = azurerm_network_interface.main[each.value].id
  network_security_group_id = azurerm_network_security_group.main[each.value].id
}