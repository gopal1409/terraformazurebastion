#resource to create public ip
resource "azurerm_public_ip" "web_linuxvm_publicip" {
  name = "${local.resource_name_prefix}-web-linuxvm-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static" #Dynamic you can take it for development purpose. if you shutdown your vm and start again the public ip will change
  sku = "Standard"
  domain_name_label = "app1-vm-${random_string.myrandom.id}"
}