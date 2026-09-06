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

module "storage_Account" {
  source = "./module/storage_account"
  rg_name = var.rg_name
  location = var.location
  storage_account_name = var.storage_account_name
  
}

module "storage_acct_us" {
  source = "./module/storage_account"
  rg_name = "rg-terraform-lab-eastus"
  location = "East US"
  storage_account_name = "sttflabeastus1992"
}