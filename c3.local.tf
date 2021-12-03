locals {
  owners = var.business_devision 
  environment = var.environment
  resource_name_prefix = "${var.business_devision}-${var.environment}" #mostly local variable is used for concatination
  common_tags = {
      owners  = local.owners
      environment = local.environment
  }
}