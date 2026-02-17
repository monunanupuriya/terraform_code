resource "azurerm_network_interface" "mknic" {
  name                = "mk-nic"
  location            = azurerm_resource_group.mkrg.location
  resource_group_name = azurerm_resource_group.mkrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mksubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mkpublicip.id
  }
}