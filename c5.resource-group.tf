resource "azurerm_resource_group" "rg"{
    location = var.resource_group_location
    name = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
    #name = '${var.resource_group_name}-nic'
    tags = local.common_tags
}
/*
#random string
resource "random_string" "myrandom" {
  length = 16
  upper = false
  special = false
}

#resource azure storage account
resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.demoresourcegrp.name
  location                 = azurerm_resource_group.demoresourcegrp.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  #account_encryption_source = "Microsoft.Storage"

  tags = {
    environment = "staging"
  }
}*/