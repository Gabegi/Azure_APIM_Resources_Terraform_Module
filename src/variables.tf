
variable "subscription_id" {
    type        = string
  description = "Subscription ID"
}


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
    api_operation_name   = string # Must be unique (serves as index)
    api_name              = string # Must match api_name
    operation_id        = string
    display_name        = string
    method              = string
    url_template        = string
    description         = string
  }))
  default = []  # Makes variable optional
}
variable "operation_policies" {
  description = "Map of operation policies with policy details"
  type = map(object({
    api_name        = string                # API name
    policy_path     = string                # Path to the policy file
    operation_names = list(string)          # List of operation names
  }))
}

