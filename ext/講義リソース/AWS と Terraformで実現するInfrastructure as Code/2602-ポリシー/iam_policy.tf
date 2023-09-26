resource "aws_iam_policy" "billing_deny" {
  name        = "${var.project}-${var.environment}-billling-deny-iam-policy"
  description = "Billing deny policy"
  policy      = data.aws_iam_policy_document.billing_deny.json
}

data "aws_iam_policy_document" "billing_deny" {
  statement {
    effect = "Deny"
    actions = [
      "aws-portal:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ec2_rebootable" {
  name        = "${var.project}-${var.environment}-ec2-rebootable-iam-policy"
  description = "EC2 rebootable policy"
  policy      = data.aws_iam_policy_document.ec2_rebootable.json
}

data "aws_iam_policy_document" "ec2_rebootable" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:RebootInstances"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "iam_change_own_password" {
  name        = "${var.project}-${var.environment}-iam-change_own_password-iam-policy"
  description = "IAM Change own password policy"
  policy      = data.aws_iam_policy_document.iam_change_own_password.json
}

data "aws_iam_policy_document" "iam_change_own_password" {
  statement {
    effect = "Allow"
    actions = [
      "iam:ChangePassword"
    ]
    resources = ["arn:aws:iam::*:user/$${aws:username}"]
  }
}
