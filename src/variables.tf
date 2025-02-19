variable "apis" {
  description = "List of APIs"
  type = list(object({
    api_name              = string # Must be unique (serves as index)
    api_revision          = string
    display_name          = string
    path                  = string
    protocols             = list(string)
    api_type              = string
    api_description       = string
    api_version           = string 
    subscription_required = bool
    version_set_name      = string  # Must match api_version_set_name
    service_url           = optional(string) # Makes variable optional
    openapi_file          = optional(string) # Makes variable optional
    content_format        = optional(string)  # Makes variable optional
  }))
}

variable "api_version_sets" {
  description = "List of API Version Sets"
  type = list(object({
    api_version_set_name        = string # Must be unique (serves as index)
    api_version_set_display_name = string
  }))
}

variable "api_policies" {
  description = "List of API Policies"
  type = list(object({
    api_policy_name      = string # Must be unique (serves as index)
    api_name              = string # Must match api_name
    xml_content           = string
  }))
  default = []  # Makes variable optional
}

variable "api_operations" {
  description = "List of API Operations"
  type = list(object({
    api_operation_name = string
    api_name           = string
    operation_id       = string
    display_name       = string
    method             = string
    url_template       = string
    description        = string
    template_parameter = optional(list(object({
      name     = string
      type     = string
      required = optional(bool, false)
    })), []) # Defaults to an empty list if not provided
  }))
}

variable "operation_policies" {
  description = "Map of operation policies with policy details"
  type = map(object({
    operation_policy_name = string # Must be unique (serves as index)
    api_name        = string                # API name
    policy_path     = string                # Path to the policy file
    operation_names = map(string)           # List of operation names
  }))
}

variable "products" {
  description = "List of Products"
  type = object({
    display_name          = string
    product_id            = string
    subscription_required = bool
    published             = bool
  })
}
  

variable "apim" {
  type    = map(string)
  default = {}
}


variable "subscription_id" {
  type = string
}

