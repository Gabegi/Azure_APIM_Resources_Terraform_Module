module "apis" {
  source = "./modules/api"
  apis = var.apis
  api_version_sets = var.api_version_sets
  apim = {
    resource_group_name = data.azurerm_api_management.apim_eden.resource_group_name
    name                = data.azurerm_api_management.apim_eden.name
  }
  api_policies = []
  api_operations = var.api_operations
  operation_policies = var.operation_policies
}