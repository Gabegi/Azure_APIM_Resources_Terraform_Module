# Azure_APIM_Resources_Terraform_Module
This repository provides code examples that are explained in this blog [Azure APIM Using Terraform](https://medium.com/@codebob75/azure-apim-using-terraform-f439e93bb4f1)

To use this code, first create a file called values.tfvars file with your subscription key in the folder vars.
Then, navigate to the repo and run:
- terraform init
- terraform plan -var-file="vars/values.tfvars"
- terraform apply -auto-approve -var-file="vars/values.tfvars" 
- terraform destroy -var-file="vars/values.tfvars"

To create an API, simply 