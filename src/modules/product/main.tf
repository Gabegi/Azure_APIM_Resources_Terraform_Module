
resource "azurerm_api_management_product" "apim_product" {

  resource_group_name   = var.apim.resource_group_name
  api_management_name   = var.apim.name

  display_name          = var.apim_product.display_name
  product_id            = var.apim_product.product_id
  subscription_required = var.apim_product.subscription_required
  published             = var.apim_product.published
}

resource "azurerm_api_management_product_api" "apim_product_api" {

    for_each = toset(var.apim_products_api)

  resource_group_name = var.apim.resource_group_name
  api_management_name = var.apim.name

  api_name            = each.value
  product_id          = azurerm_api_management_product.apim_product.product_id

  // Subscription allow_tracing = true
}

