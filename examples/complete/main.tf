module "example" {
  source                        = "../.."
  enable_cloudtrail             = var.enable_cloudtrail
  enable_controller             = var.enable_controller
  cloudtrail_bucket_name        = var.cloudtrail_bucket_name
  ciem_member_account_role_name = var.ciem_member_account_role_name
  ciem_oidc_provider_role_name  = var.ciem_oidc_provider_role_name
  oidc_provider_account_id      = var.oidc_provider_account_id
  tenant_id                     = var.tenant_id
}
