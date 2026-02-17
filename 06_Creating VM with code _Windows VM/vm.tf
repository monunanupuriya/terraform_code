resource "azurerm_windows_virtual_machine" "mkvm" {
  name                = "mk-vm"
  resource_group_name = azurerm_resource_group.mkrg.name
  location            = azurerm_resource_group.mkrg.location
  size                = "Standard_D2ls_v5"
  admin_username      = "adminuser"
  admin_password      = "adminuser@123456"
  network_interface_ids = [
azurerm_network_interface.mknic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-Datacenter"
    version   = "latest"
  }
}