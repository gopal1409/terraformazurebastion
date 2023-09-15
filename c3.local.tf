# Define Local Values in Terraform
## in terraform you create a block called as local varaible to do concatination of two different varaible
locals {
  owners = var.business_divsion
  environment = var.environment
  resource_name_prefix = "${var.business_divsion}-${var.environment}"
  #name = "${local.owners}-${local.environment}"
  #to identify your resource easily
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
} 