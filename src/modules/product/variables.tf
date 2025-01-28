variable "apim_product" {
  description = "API Management Product"
  type = object({
    display_name          = string
    product_id            = string
    subscription_required = bool
    published             = bool
  })
}

variable "apim_products_api" {
  description = "List of API names to be added to the product"
  type        = list(string)  # Change this to a list of strings
}


variable "apim" {
  type    = map(string)
  default = {}
}


