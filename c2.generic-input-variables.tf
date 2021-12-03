#generic input variable
#business devision
variable "business_devision" {
    description = "business division in large organization"
    type = string
    default = "sap"
}

#environment variable
variable "environment" {
  type = string
  default = "dev"
}

#azure resource group name

variable "resource_group_name" {
  type = string
  default = "rg-default"
}

variable "resource_group_location" {
  type = string
  default = "eastus2"
}