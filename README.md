# Azure_APIM_Resources_Terraform_Module
This repository provides code examples that are explained in this blog [Azure APIM Using Terraform](https://medium.com/@codebob75/azure-apim-using-terraform-f439e93bb4f1)

To use this code, first create a file called values.tfvars file with your subscription key in the folder vars.
Then, navigate to the repo and run:
- terraform init
- terraform plan -var-file="vars/values.tfvars"
- terraform apply -auto-approve -var-file="vars/values.tfvars" 
- terraform destroy -var-file="vars/values.tfvars"

To create an API, simply add to your tfvars file
## API Module tfvars

```
version_sets = [
  {
    api_version_set_name        = "my-version-set"
    api_version_set_display_name = "My Version Set"
  }
]

apis = [
  {
    api_name              = "MyAPI"
    api_revision          = "1"
    display_name          = "MyAPI"
    path                  = "my-api"
    protocols             = ["https"]
    api_type              = "http"
    api_description       = "Connect to my API  backend"
    api_version           = "v1"
    subscription_required = true
    version_set_name      = "my-version-set" # must match version set name
    content_format        = "openapi"
    openapi_file          = "./api-definitions/mydomainname/myapidefinitionfile.yaml"
  }
]

api_policies = [
  {
    api_policy_name      = "MyAPI-policy" # Must be unique (serves as index)
    api_name              = "MyAPI" # Must match api_name
    xml_content           = "./api-policies/mydomain/mypolicyname.xml"
  }
]

api_operations = [
  /// BC Batch
  {
    api_operation_name = "MyAPI-operation_1" # servers as index
    api_name      = "MyAPI" # must match API name
    operation_id  = "operation_1"
    display_name  = "Op 1"
    method        = "POST"
    url_template  = "/$items"
    description   = "An operation to create new items"
  }
]


bc_operation_policies = {
  MyAPI_opPolicy = {
    api_name              = "MyAPI" # must match api name, serves as index
    operation_policy_name = "MyAPI-opPolicy"
    policy_path           = "./api-policies/mydomain/mypolicyname.xml"
    operation_names = {
      api_operation_operation_1_operation_id  = "operation_1" # must match operation_id
    }
  }
}
```

## Product Module tfvars