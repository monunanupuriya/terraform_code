resource "azurerm_public_ip" "mkpublicip" {
  name                = "mk-PublicIp123"
  resource_group_name = azurerm_resource_group.mkrg.name
  location            = azurerm_resource_group.mkrg.location
  allocation_method   = "Static"
}