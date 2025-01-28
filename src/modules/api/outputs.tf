output "api_names" {
  description = "The names of the APIs created"
  value = [for api in azurerm_api_management_api.api : api.name]
}
