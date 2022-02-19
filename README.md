<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.23 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.cloud_trail_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.controller_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ciem_member_account_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloud_trail_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.controller_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy.security_audit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ciem_cloudtrail_account_role_name"></a> [ciem\_cloudtrail\_account\_role\_name](#input\_ciem\_cloudtrail\_account\_role\_name) | name of the iam role to access cloudtrail bucket | `any` | n/a | yes |
| <a name="input_ciem_oidc_provider_role_name"></a> [ciem\_oidc\_provider\_role\_name](#input\_ciem\_oidc\_provider\_role\_name) | name of the iam role oidc provider can assume role into | `any` | n/a | yes |
| <a name="input_cloudtrail_bucket_name"></a> [cloudtrail\_bucket\_name](#input\_cloudtrail\_bucket\_name) | s3 bucket name where cloudtrail logs are stored | `any` | n/a | yes |
| <a name="input_oidc_provider_account_id"></a> [oidc\_provider\_account\_id](#input\_oidc\_provider\_account\_id) | account id where oidc provider is created | `any` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | id of the tenant where the application is created | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->