module "eks" {
  source           = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-eks?ref=main"
  for_each         = var.create_eks_config
  cluster_name     = each.value.cluster_name
  cluster_role_arn = each.value.cluster_role_arn

  # optional
  kubernetes_version                          = try(each.value.kubernetes_version, null)
  upgrade_policy                              = try(each.value.upgrade_policy, null)
  kubernetes_service_ipv4_cidr                = try(each.value.kubernetes_service_ipv4_cidr, null)
  kubernetes_ip_family                        = try(each.value.kubernetes_ip_family, null)
  elastic_load_balancing_enabled              = try(each.value.elastic_load_balancing_enabled, null)
  vpc_id                                      = try(each.value.vpc_id, null)
  subnet_ids                                  = try(each.value.subnet_ids, null)
  cluster_security_group_ids                  = try(each.value.cluster_security_group_ids, null)
  cluster_endpoint_private_access             = try(each.value.cluster_endpoint_private_access, null)
  cluster_endpoint_public_access              = try(each.value.cluster_endpoint_public_access, null)
  cluster_endpoint_public_access_cidrs        = try(each.value.cluster_endpoint_public_access_cidrs, null)
  authentication_mode                         = try(each.value.authentication_mode)
  bootstrap_cluster_creator_admin_permissions = try(each.value.bootstrap_cluster_creator_admin_permissions, null)
  zonal_shift_config_enable                   = try(each.value.zonal_shift_config_enable, null)
  enabled_cluster_log_types                   = try(each.value.enabled_cluster_log_types, null)
  outpost_config                              = try(each.value.outpost_config, {})
  encryption_config                           = try(each.value.encryption_config, {})
  access_entries                              = try(each.value.access_entries, {})
  access_policy_associations                  = try(each.value.access_policy_associations, {})
  tags                                        = try(each.value.tags, {})
  //插件
  addons = try(each.value.addons, null)
  //节点组
  node_groups = try(each.value.node_groups, {})
}
