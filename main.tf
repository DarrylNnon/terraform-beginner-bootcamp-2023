terraform {
  # backend remote
  cloud { 
    
    organization = "Terraform-Bootcamp-2025" 

    workspaces { 
      name = "terra-house-1" 
  } 
}
  
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

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  lower            = true
  upper            = false
  length           = 16
  special          = false
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}