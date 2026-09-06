resource "azurerm_resource_group" "lab"{
    name = var.rg_name
    location = var.location
}
resource "azurerm_storage_account" "lab" {
  resource_group_name = azurerm_resource_group.lab.name
  location = azurerm_resource_group.lab.location
  name = var.storage_account_name
  account_tier = "Standard"
  account_replication_type = "LRS"
  
}