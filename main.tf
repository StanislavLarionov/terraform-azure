provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "my-terraform-rg-github-actions-001"
  location = "West Europe"
}

resource "azurerm_storage_account" "sa" {
  name                     = "terraformazurelarionov"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Environment = "Dev"
    Project     = "TerraformGitHubActionsAzure"
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.sa.primary_blob_endpoint
}
