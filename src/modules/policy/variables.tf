variable "operation_policies" {
  description = "Map of operation policies with policy details"
  type = map(object({
    operation_policy_name = string # Must be unique (serves as index)
    api_name        = string                # API name
    policy_path     = string                # Path to the policy file
    operation_names = list(string)           # List of operation names
  }))
}

variable "selected_operation_ids" {
  description = "The operation IDs to apply policies to"
  type        = list(string)
#   default     = ["operation-id-1", "operation-id-2"]
}

variable "operation_ids" {
  description = "List of operation IDs unfiltered"
  type = list(string)
}