resource "azurerm_api_management_named_value" "named-value" {

    for_each = { for nv in var.named_values : nv.value_name  => nv }

  
  api_management_name = var.apim.name
  resource_group_name = var.apim.resource_group_name

  name                = each.value.value_name
  display_name        = each.value.display_name
  value               = each.value.value
}