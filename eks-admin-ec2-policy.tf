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
                "autoscaling:DescribeAutoScalingNotificationTypes",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:CreateKeyPair",
                "ec2:DeleteTags",
                "autoscaling:EnterStandby",
                "autoscaling:DescribePolicies",
                "ec2:UpdateSecurityGroupRuleDescriptionsIngress",
                "autoscaling:PutScheduledUpdateGroupAction",
                "ec2:GetLaunchTemplateData",
                "ec2:StartInstances",
                "ec2:RevokeSecurityGroupEgress",
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeWarmPool",
                "autoscaling:UpdateAutoScalingGroup",
                "autoscaling:DescribeInstanceRefreshes",
                "ec2:DescribeKeyPairs",
                "autoscaling:TerminateInstanceInAutoScalingGroup",
                "autoscaling:PutNotificationConfiguration",
                "autoscaling:DeleteTags",
                "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
                "autoscaling:ResumeProcesses",
                "ec2:ImportKeyPair",
                "ec2:DescribeLaunchTemplates",
                "autoscaling:SetDesiredCapacity",
                "ec2:CreateTags",
                "autoscaling:DeleteWarmPool",
                "autoscaling:DescribeTags",
                "ec2:RunInstances",
                "ec2:ModifySecurityGroupRules",
                "autoscaling:SuspendProcesses",
                "ec2:StopInstances",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:DescribeSecurityGroupRules",
                "autoscaling:AttachInstances",
                "autoscaling:CreateOrUpdateTags",
                "autoscaling:DeleteAutoScalingGroup",
                "autoscaling:CancelInstanceRefresh",
                "autoscaling:DeleteLifecycleHook",
                "ec2:DeleteKeyPair",
                "autoscaling:CreateAutoScalingGroup",
                "autoscaling:DetachInstances",
                "autoscaling:DeleteScheduledAction",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:ExitStandby",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DeletePolicy",
                "ec2:CreateSecurityGroup",
                "autoscaling:PutScalingPolicy",
                "ec2:DeleteLaunchTemplateVersions",
                "autoscaling:DeleteNotificationConfiguration",
                "autoscaling:SetInstanceHealth",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:DeleteLaunchTemplate",
                "ec2:DescribeTags",
                "ec2:DescribeLaunchTemplateVersions",
                "autoscaling:PutLifecycleHook",
                "ec2:DescribeSecurityGroups",
                "ec2:CreateLaunchTemplateVersion",
                "autoscaling:StartInstanceRefresh",
                "ec2:DescribeImages",
                "autoscaling:CreateLaunchConfiguration",
                "ec2:CreateLaunchTemplate",
                "autoscaling:CompleteLifecycleAction",
                "ec2:DescribeSecurityGroupReferences",
                "autoscaling:DeleteLaunchConfiguration",
                "autoscaling:SetInstanceProtection",
                "ec2:DeleteSecurityGroup",
                "ec2:ModifyLaunchTemplate",
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
