# Terraform Beginner Bootcamp 2023 - week 1

## Root Module structure

Our root module structure is as follows:

PROJECT_ROOT
```
│── variables.tf          # Store the structure of input variables

│── main.tf               # Everything else

│── providers.tf          # Define required providers and their configurations

│── outputs.tf            # Stores our outputs

│── terraform.tfvars      # The data of variables we want to load into our 
Terraform project

└── Readme.md             # Required for root modules
```
    
[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
