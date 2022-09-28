module "eks_admin_ec2_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.4.0"

  name        = "eks-admin-ec2-policy"
  path        = "/"
  description = "Policy to manage EC2 and ALB"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:DeleteTags",
                "ec2:CreateKeyPair",
                "ec2:UpdateSecurityGroupRuleDescriptionsIngress",
                "ec2:GetLaunchTemplateData",
                "ec2:StartInstances",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:CreateSecurityGroup",
                "ec2:DeleteLaunchTemplateVersions",
                "ec2:DescribeKeyPairs",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:DeleteLaunchTemplate",
                "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
                "ec2:ImportKeyPair",
                "ec2:DescribeLaunchTemplates",
                "ec2:DescribeTags",
                "ec2:CreateTags",
                "ec2:DescribeLaunchTemplateVersions",
                "ec2:RunInstances",
                "ec2:ModifySecurityGroupRules",
                "ec2:StopInstances",
                "ec2:DescribeSecurityGroups",
                "ec2:CreateLaunchTemplateVersion",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:DescribeImages",
                "ec2:CreateLaunchTemplate",
                "ec2:DescribeSecurityGroupRules",
                "ec2:DescribeSecurityGroupReferences",
                "ec2:DeleteSecurityGroup",
                "ec2:ModifyLaunchTemplate",
                "ec2:DeleteKeyPair",
                "ec2:DescribeStaleSecurityGroups"
            ],
            "Resource": "*"
        }
    ]
}
EOF
  tags = {
    Name              = "eks-admin-ec2-policy"
    managed-by        = "terraform-eks-permissions"
    PolicyDescription = "Policy to manage EC2 and ALB"
  }
}
