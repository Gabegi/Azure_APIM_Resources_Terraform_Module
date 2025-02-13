module "apis" {
  source = "./modules/api"
  apis = var.apis
  api_version_sets = var.api_version_sets
  apim = {
    resource_group_name = azurerm_resource_group.rg.name
    name                = azurerm_api_management.apim.name
  }
  api_policies = []
  api_operations = var.api_operations
  operation_policies = var.operation_policies
}

module "products" {
  source = "./modules/product"
  apim = {
    resource_group_name = azurerm_resource_group.rg.name
    name                = azurerm_api_management.apim.name
  }
  apim_products_api = module.apis.api_names
  apim_product = var.products
  
}