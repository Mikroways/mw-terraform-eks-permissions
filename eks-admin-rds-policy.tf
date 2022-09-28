module "eks_admin_rds_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.4.0"

  name        = "eks-admin-rds-policy"
  path        = "/"
  description = "Policy to manage RDS"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "rds:*",
            "Resource": "*"
        }
    ]
}
EOF

tags = {
  Name              = "eks-admin-rds-policy"
  managed-by        = "terraform-eks-permissions"
  PolicyDescription = "Policy to manage RDS"
}

}
