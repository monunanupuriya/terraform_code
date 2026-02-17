#count
# resource "azurerm_resource_group" "rg" {
#     count = 5
#     name = "mk-rg"
#     location = "Central India"
# }

#count & count.index with interpolation & variable
# resource "azurerm_resource_group" "rg" {
#     count = 5
#     name = "mk-rg${count.index}"
#     location = "Central India"
# }

# variable "name" {
#     default = ["rg" , "mg" ,"kg" , "pg"]
# }

#count & count.index with interpolation & length & variable (resource deletion issue)
# resource "azurerm_resource_group" "rg" {
#     count = length (var.name)
#     name = var.name[count.index]
#     location = "Central India"
# }

# variable "name" {                                             #1
#     default = ["rg" , "mg" ,"kg" , "pg"]
# }

# variable "name" {                                                #2
#     default = ["rg" , "mg" , "pg"]
# }



#for_each + List
# resource "azurerm_resource_group" "rg" {
#     for_each = toset(var.rg_name)
#     name = each.value
#     location = "Central India"
# }

# variable "rg_name" {                                            
#     default = ["rg" , "mg" ,"kg" , "pg"]
# }

# variable "rg_name" {}                                          # default = ["rg" , "mg" ,"kg" , "pg"]


resource "azurerm_resource_group" "rg" {
    for_each = var.name
    name = each.value.name
    location = each.value.location
}

variable "name" {}