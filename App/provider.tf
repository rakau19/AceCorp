terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.113.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = var.client_id
  tenant_id       = var.tenant_id
  client_secret   = var.client_secret
  subscription_id = var.app_subscription_id
}
