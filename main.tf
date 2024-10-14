resource "azurerm_mssql_managed_instance" "main" {
  name                         = "${var.tenant}-${var.name}-azuresql-mi-${var.server_name}-${var.environment}"
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  subnet_id                    = var.mi_subnet_ids[0]
  license_type                 = var.license_type
  sku_name                     = var.instance_sku
  vcores                       = var.vcores
  storage_size_in_gb           = var.storage_size
  collation                    = var.collation
  public_data_endpoint_enabled = false
  minimum_tls_version          = var.minimum_tls_version
  proxy_override               = var.proxy_override
  timezone_id                  = var.timezone
  storage_account_type         = (var.zone_redundant_backup_enabled == true) ? "ZRS" : "LRS"
  zone_redundant_enabled       = var.zone_redundant_instance_enabled
  administrator_login          = random_string.dbuser.result
  administrator_login_password = random_password.dbpass.result

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Name        = "${var.tenant}-${var.name}-azuresql-mi-${var.server_name}-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}
