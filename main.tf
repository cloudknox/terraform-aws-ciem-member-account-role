data "aws_iam_policy" "security_audit" {
  arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

resource "aws_iam_role" "ciem_member_account_role" {
  name = var.ciem_cloudtrail_account_role_name
  assume_role_policy = templatefile("${path.module}/template/oidc_assume_role_policy.json", {
    ACCOUNT_ID = var.oidc_provider_account_id,
    ROLE_NAME  = var.ciem_oidc_provider_role_name
  })
  managed_policy_arns = [
    aws_iam_policy.cloud_trail_access_policy.arn,
    data.aws_iam_policy.security_audit.arn
  ]
  tags = {}
}

resource "aws_iam_policy" "cloud_trail_access_policy" {
  count = var.enable_cloudtrail ? 1 : 0
  name  = "ciem-cloudtrail-${var.tenant_id}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.cloudtrail_bucket_name}*",
          "arn:aws:s3:::${var.cloudtrail_bucket_name}*/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cloud_trail_access_policy" {
  count      = var.enable_cloudtrail ? 1 : 0
  role       = aws_iam_role.ciem_member_account_role.name
  policy_arn = aws_iam_policy.cloud_trail_access_policy.arn
}

resource "aws_iam_policy" "controller_access_policy" {
  count = var.enable_controller ? 1 : 0
  name  = "ciem-controller-${var.tenant_id}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:AttachGroupPolicy",
          "iam:AttachRolePolicy",
          "iam:AttachUserPolicy",
          "iam:CreatePolicy",
          "iam:CreatePolicyVersion",
          "iam:DeletePolicy",
          "iam:DeletePolicyVersion",
          "iam:DeleteGroupPolicy",
          "iam:DeleteRolePolicy",
          "iam:DeleteUserPolicy",
          "iam:DetachGroupPolicy",
          "iam:DetachRolePolicy",
          "iam:DetachUserPolicy",
          "iam:PutGroupPolicy",
          "iam:PutRolePolicy",
          "iam:PutUserPolicy",
          "iam:PutUserPermissionsBoundary",
          "iam:SetDefaultPolicyVersion"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "controller_access_policy" {
  count      = var.enable_controller ? 1 : 0
  role       = aws_iam_role.ciem_member_account_role.name
  policy_arn = aws_iam_policy.controller_access_policy.arn
}
