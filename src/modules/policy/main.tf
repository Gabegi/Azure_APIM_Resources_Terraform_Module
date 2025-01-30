resource "azurerm_api_management_api_policy" "api_operations_policy" {
  for_each = {
    for operation in azurerm_api_management_operation.api_operations_policy :
    operation.id => operation
    if operation.id in var.selected_operation_ids
  }

  resource_group_name   = var.apim.resource_group_name
  api_management_name   = var.apim.name
  api_name              = each.value.api_name
  
  xml_content = templatefile(
    each.value.policy_path,
    {
      operations = {
        for key, value in each.value.operation_names :
        key => azurerm_api_management_api_operation.api_operations[key].id
        if contains(keys(azurerm_api_management_api_operation.api_operations), key)
      }
    }
  )

  depends_on = [azurerm_api_management_api_operation.api_operations]
}
