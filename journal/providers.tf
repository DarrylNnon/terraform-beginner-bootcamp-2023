
terraform {
#  # backend remote
# cloud { 
#    
#    organization = "Terraform-Bootcamp-2025" 
#
#    workspaces { 
#      name = "terra-house-1" 
# } 
#}
  
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
provider "random" {

}