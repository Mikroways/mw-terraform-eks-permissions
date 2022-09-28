module "eks_admin_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.4.0"

  name        = "eks-admin-iam-policy"
  path        = "/"
  description = "Policy to manage IAM"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:UpdateAssumeRolePolicy",
                "iam:GetPolicyVersion",
                "iam:ListRoleTags",
                "iam:UntagRole",
                "iam:TagRole",
                "iam:UpdateOpenIDConnectProviderThumbprint",
                "iam:DeletePolicy",
                "iam:CreateRole",
                "iam:AttachRolePolicy",
                "iam:PutRolePolicy",
                "iam:DeleteRolePermissionsBoundary",
                "iam:ListInstanceProfilesForRole",
                "iam:PassRole",
                "iam:DetachRolePolicy",
                "iam:DeleteRolePolicy",
                "iam:ListAttachedRolePolicies",
                "iam:ListOpenIDConnectProviderTags",
                "iam:ListPolicyTags",
                "iam:ListRolePolicies",
                "iam:DeleteOpenIDConnectProvider",
                "iam:ListPolicies",
                "iam:GetRole",
                "iam:GetPolicy",
                "iam:RemoveClientIDFromOpenIDConnectProvider",
                "iam:AttachUserPolicy",
                "iam:ListRoles",
                "iam:DeleteRole",
                "iam:UpdateRoleDescription",
                "iam:TagPolicy",
                "iam:CreateOpenIDConnectProvider",
                "iam:CreatePolicy",
                "iam:ListPolicyVersions",
                "iam:ListOpenIDConnectProviders",
                "iam:UntagPolicy",
                "iam:UpdateRole",
                "iam:UntagOpenIDConnectProvider",
                "iam:GetOpenIDConnectProvider",
                "iam:AddClientIDToOpenIDConnectProvider",
                "iam:TagOpenIDConnectProvider",
                "iam:GetRolePolicy"
            ],
            "Resource": "*"
        }
    ]
}
EOF

  tags = {
    Name              = "eks-admin-iam-policy"
    managed-by        = "terraform-eks-permissions"
    PolicyDescription = "Policy to manage IAM"
  }
}
