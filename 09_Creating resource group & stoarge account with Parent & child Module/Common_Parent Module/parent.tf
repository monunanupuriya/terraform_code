module "rg1" {
  source = "../Azurerm_Resource_Group_Child Module"
}

module "stg" {
    depends_on = [ module.rg ]
  source = "../Azurerm_Storage_Account_Child Module"
}
