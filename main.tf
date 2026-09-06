terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-backend"
    storage_account_name = "tsstatestorage1992"
    container_name       = "tfstate"
    use_azuread_auth     = true
  }
}



provider "azurerm" {
  features {}
}

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