module "eks_admin_eks_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.4.0"

  name        = "eks-admin-eks-policy"
  path        = "/"
  description = "Policy to manage EKS"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "eks:*",
            "Resource": "*"
        }
    ]
}
EOF
  tags = {
    Name              = "eks-admin-eks-policy"
    managed-by        = "terraform-eks-permissions"
    PolicyDescription = "Policy to manage EKS"
  }

}
