variable "cloudtrail_bucket_name" {
  description = "s3 bucket name where cloudtrail logs are stored"
}

variable "ciem_oidc_provider_role_name" {
  description = "name of the iam role oidc provider can assume role into"
}

variable "ciem_cloudtrail_account_role_name" {
  description = "name of the iam role to access cloudtrail bucket"
}

variable "oidc_provider_account_id" {
  description = "account id where oidc provider is created"
}

variable "tenant_id" {
  description = "id of the tenant where the application is created"
}
