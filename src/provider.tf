terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    
  }
}

data "azurerm_client_config" "current" {}



