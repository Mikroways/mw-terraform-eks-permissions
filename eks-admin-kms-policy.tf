module "eks_admin_kms_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.4.0"

  name        = "eks-admin-kms-policy"
  path        = "/"
  description = "Policy to manage KMS"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
EOF

  tags = {
    Name              = "eks-admin-kms-policy"
    managed-by        = "terraform-eks-permissions"
    PolicyDescription = "Policy to manage KMS"
  }
}
