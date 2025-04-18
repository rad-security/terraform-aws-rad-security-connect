# Policy
data "aws_iam_policy_document" "assume_role" {
  count = var.secondary_region ? 0 : 1
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]

    principals {
      type        = "AWS"
      identifiers = [var.rad-security_assumed_role_arn, var.rad-security_deprecated_assumed_role_arn]
    }

    dynamic "condition" {
      for_each = var.aws_external_id != "" ? [var.aws_external_id] : []
      content {
        test     = "StringEquals"
        variable = "sts:ExternalId"
        values   = [condition.value]
      }
    }
  }
}

# Role
resource "aws_iam_role" "this" {
  count                = var.secondary_region ? 0 : 1
  name                 = "rad-security-connect"
  path                 = "/"
  max_session_duration = 3600
  description          = "IAM role for rad-security-connect"
  tags                 = var.tags

  assume_role_policy = data.aws_iam_policy_document.assume_role[0].json
}

# Instance profile
resource "aws_iam_instance_profile" "this" {
  count = var.secondary_region ? 0 : 1

  name = aws_iam_role.this[0].name
  role = aws_iam_role.this[0].name
  tags = var.tags
}

resource "rad-security_aws_register" "this" {
  count                         = var.secondary_region ? 0 : 1
  rad_security_assumed_role_arn = var.rad-security_assumed_role_arn
  aws_account_id                = data.aws_caller_identity.current.account_id
}
