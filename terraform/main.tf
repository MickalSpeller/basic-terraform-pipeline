provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-tf-python-app"
  location = "East US"
}

resource "azurerm_service_plan" "plan" {
  name                = "asp-tf-python-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "tf-python-app-5zrg6iviyu"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      python_version = "3.14"
    }
  }

  app_settings = {
    "WEBSITES_PORT" = "8000"
    "WEBSITES_CONTAINER_START_TIME_LIMIT" = "1800"
  }
}

resource "random_string" "suffix" {
  length  = 10
  special = false
  upper   = false
}
