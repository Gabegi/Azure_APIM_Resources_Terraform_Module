resource "azurerm_api_management_api_version_set" "version_set" {
  for_each = { for vs in var.api_version_sets : vs.api_version_set_name => vs }

  api_management_name = var.apim.name
  resource_group_name = var.apim.resource_group_name

  name                = each.value.api_version_set_name
  display_name        = each.value.api_version_set_display_name
  versioning_scheme   = "Segment"
}

resource "azurerm_api_management_api" "api" {
  for_each = { for api in var.apis : api.api_name => api }

  name                = each.value.api_name
  api_management_name = var.apim.name
  resource_group_name = var.apim.resource_group_name

  revision              = each.value.api_revision
  display_name          = each.value.display_name
  path                  = each.value.path
  protocols             = each.value.protocols
  api_type              = each.value.api_type
  description           = each.value.api_description
  version               = each.value.api_version
  subscription_required = each.value.subscription_required
  service_url           = each.value.service_url

  version_set_id  = azurerm_api_management_api_version_set.version_set[each.value.version_set_name].id
}

// nullable
resource "azurerm_api_management_api_policy" "api_policy" {

    for_each = { for policy in var.api_policies : policy.api_policy_name => policy }

  api_name            = each.value.api_name
  api_management_name = var.apim.name
  resource_group_name = var.apim.resource_group_name

  xml_content = file(each.value.xml_content)

}

// nullable
resource "azurerm_api_management_api_operation" "api_operation" {

    
    for_each = { for operation in var.api_operations : operation.api_operation_name => operation}


  resource_group_name = var.apim.resource_group_name
  api_management_name = var.apim.name

  api_name            = each.value.api_name
  operation_id        = each.value.operation_id
  display_name        = each.value.display_name
  method              = each.value.method
  url_template        = each.value.url_template
  description         = each.value.description


  response {
    status_code = 200 // TBC
  }
}

// nullable
resource "azurerm_api_management_api_policy" "api_operations_policy" {

    for_each = { for policy in var.operation_policies : policy.operation_policy_name => policy}

  resource_group_name = var.apim.resource_group_name
  api_management_name = var.apim.name
  api_name            = each.value.api_name

  # Build the xml_content dynamically
  xml_content = templatefile(
    each.value.policy_path,
    {
      operations = {
        for op in each.value.operation_names :
        op => azurerm_api_management_api_operation.api_operations[op].operation_id
      }
    }
  )

  depends_on = [azurerm_api_management_api_operation.api_operations]
}