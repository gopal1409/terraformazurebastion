# Resource-1: Azure Resource Group
#if you want to call an local value always put local in front of it and call the value
resource "azurerm_resource_group" "rg" {
  # name = "${local.resource_name_prefix}-${var.resource_group_name}"
  name = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
  location = var.resource_group_location
  #when i cresate the rg it will have how many tags two. 
  tags = local.common_tags
}