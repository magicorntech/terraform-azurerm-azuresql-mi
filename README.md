# terraform-azurerm-azuresql-mi

Magicorn made Terraform Module for Azure Provider
--
```
module "azuresql-mi-master" {
  source        = "magicorntech/azuresql-mi/azurerm"
  version       = "0.0.1"
  tenant        = var.tenant
  name          = var.name
  environment   = var.environment
  rg_name       = azurerm_resource_group.main.name
  rg_location   = azurerm_resource_group.main.location
  mi_subnet_ids = module.network.mi_subnet_ids

  # Managed Instance Configuration
  server_name                     = "master"
  license_type                    = "LicenseIncluded"
  instance_sku                    = "GP_Gen5"
  vcores                          = 4
  storage_size                    = 64 # GB
  collation                       = "SQL_Latin1_General_CP1_CI_AS"
  minimum_tls_version             = "1.0"
  proxy_override                  = "Proxy"
  timezone                        = "South Africa Standard Time"
  zone_redundant_backup_enabled   = true
  zone_redundant_instance_enabled = true
}