resource "aws_iam_role_policy" "ec2_secret_access" {
  role   = aws_iam_role.ec2_role.id
  policy = data.aws_iam_policy_document.rds_secret_access.json
}
