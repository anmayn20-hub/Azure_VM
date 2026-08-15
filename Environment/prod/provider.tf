terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backend_rg"
    storage_account_name = "backendsa1907"
    container_name       = "bluedrum"
    key                  = "module.tfstate"
  }
}

provider "azurerm" {
  features {}
}