resource "azurerm_virtual_network" "mkvnet" {
  name                = "mk-vnet123"
  location            = azurerm_resource_group.mkrg.location
  resource_group_name = azurerm_resource_group.mkrg.name
  address_space       = ["10.0.0.0/16"]
}