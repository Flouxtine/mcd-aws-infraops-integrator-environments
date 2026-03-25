output "aws_eks_arn" {
  value = { for k, v in module.eks : k => v.cluster_arn }
}

output "aws_eks_id" {
  value = { for k, v in module.eks : k => v.cluster_id }
}

output "aws_eks_addon_arn" {
  value = { for k, v in module.eks : k => v.addon_arns }
}

output "aws_eks_node_group_arns" {
  value = { for k, v in module.eks : k => v.node_group_arns }
}