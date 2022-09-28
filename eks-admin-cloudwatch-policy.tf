module "eks_admin_cloudwatch_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.4.0"

  name        = "eks-admin-cloudwatch-policy"
  path        = "/"
  description = "Policy to manage CloudWatch"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "logs:ListTagsLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DeleteLogGroup",
                "logs:PutRetentionPolicy",
                "logs:CreateLogGroup",
                "logs:DeleteLogStream"
            ],
            "Resource": "*"
        }
    ]
}
EOF

  tags = {
    Name              = "eks-admin-cloudwatch-policy"
    managed-by        = "terraform-eks-permissions"
    PolicyDescription = "Policy to manage CloudWatch"
  }
}
