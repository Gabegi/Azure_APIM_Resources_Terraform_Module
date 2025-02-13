variable "named_values" {
  description = "List of Named Values"
  type = list(object({
    value_name    = string
    display_name  = string
    value         = string
    secret        = bool
  }))
}


variable "apim" {
  type    = map(string)
  default = {}
}