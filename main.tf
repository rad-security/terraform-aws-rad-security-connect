# Policy
data "aws_iam_policy_document" "assume_role" {
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
  name                 = var.rad-security_role_name
  path                 = "/"
  max_session_duration = 3600
  description          = "IAM role for Rad Security to connect to your AWS account"
  tags                 = var.tags

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Instance profile
resource "aws_iam_instance_profile" "this" {
  name = aws_iam_role.this.name
  role = aws_iam_role.this.name
  tags = var.tags
}

resource "rad-security_aws_register" "this" {
  rad_security_assumed_role_arn = var.rad-security_assumed_role_arn
  aws_account_id                = data.aws_caller_identity.current.account_id
}
