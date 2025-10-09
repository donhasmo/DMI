data "aws_iam_policy_document" "rds_secret_access" {
  statement {
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [var.rds_secret_arn]
  }
}