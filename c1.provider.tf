# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
#terraform init
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      #version = "1.44.0" #optional
    }
    random = {
      source = "hashicorp/random"
      version = ">=3.0"
    }
  }
} #it download all the plugin 

# Configure the Microsoft Azure Provider
#dev environment
#terraform apply for first time it is autmatically generate your terraform.tfstate to store your configuration
#when you to terrafomr apply second time it will read your previous tfstate file. once completed it will put the previous file as terraform.tfstate.backup
provider "azurerm" {
  features {} #if i use the first provider with a vm and delete the vm the storage will be deleted
}
#prod
#if i use the second provider and delete my vm the storage will not be deleted as in feature we put delete on disk false