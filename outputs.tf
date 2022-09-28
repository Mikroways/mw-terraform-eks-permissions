output "terraform-eks-admin-role-arn" {
  value = module.eks-terraform-admin-role.admin_iam_role_arn
}
