variable "enable_cloudtrail" {
  description = "enable cloudtrail if default cloudtrail account is not used"
  default     = false
}
variable "enable_controller" {
  description = "enabling controller gives cloudknox permissions management the privileges to provide the privilege-on-demand feature"
  default     = false
}

variable "cloudtrail_bucket_name" {
  description = "s3 bucket name where cloudtrail logs are stored"
  type        = string
  default     = ""
}

variable "ciem_member_account_role_name" {
  description = "name of the iam role to access member account"
  type        = string
}

variable "ciem_oidc_provider_role_name" {
  description = "name of the iam role oidc provider can assume role into"
  type        = string
}

variable "oidc_provider_account_id" {
  description = "account id where oidc provider is created"
  type        = string
}

variable "tenant_id" {
  description = "id of the tenant where the application is created"
  type        = string
}
