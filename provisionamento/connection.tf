terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

#Configure the AWS Provider
#provider "aws" {
#  version = "~> 2.0"
#  region = "us-east-1" 
#}

#provider "aws" {
#  alias = "us-east-2"
#  version = "~> 2.0"
#  region = "us-east-2"
#}

terraform {
  backend "remote" {
    organization = "unyleya"

    workspaces {
      name = "unyleya"
    }
  }
}