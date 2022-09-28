module "eks-terraform-admin-role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-roles"
  version = "5.4.0"

  trusted_role_arns = var.trusted_role_arns

  create_admin_role = true 
  admin_role_policy_arns = [module.eks_admin_ec2_policy.arn, module.eks_admin_iam_policy.arn, module.eks_admin_eks_policy.arn, module.eks_admin_vpc_policy.arn, module.eks_admin_rds_policy.arn, module.eks_admin_cloudwatch_policy.arn, module.eks_admin_kms_policy.arn]
  admin_role_name        = "eks-terraform-admin-role"
  admin_role_requires_mfa = false

  create_poweruser_role      = false
  create_readonly_role        = false
}
