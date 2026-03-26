module "redis" {
  for_each                   = var.create_elasticache_map
  source                     = "git::ssh://github-flouxtine:Flouxtine/aws-terraform-base-module.git//terraform-aws-elasticache?ref=main"
  create                     = each.value.create
  create_replication_group   = each.value.create_replication_group
  replication_group_id       = each.value.replication_group_id
  multi_az_enabled           = try(each.value.multi_az_enabled, false)
  cluster_mode_enabled       = try(each.value.cluster_mode_enabled, false)
  num_node_groups            = try(each.value.num_cache_nodes, 3)
  replicas_per_node_group    = try(each.value.replicas_per_node_group, null)
  cluster_mode               = try(each.value.cluster_mode, null)
  transit_encryption_enabled = try(each.value.transit_encryption_enabled, true)
  auth_token                 = try(each.value.auth_token, null)
  auto_minor_version_upgrade = try(each.value.auto_minor_version_upgrade, true)
  snapshot_retention_limit   = try(each.value.snapshot_retention_limit, 1)
  security_group_ids         = try(each.value.security_group_ids, [])
  node_type                  = try(each.value.node_type, "cache.m5.large")
  engine_version             = try(each.value.engine_version, null)
  num_cache_clusters         = try(each.value.num_cache_clusters, null)
  description                = try(each.value.description, " ")
  auth_token_update_strategy = try(each.value.auth_token_update_strategy, null)
  subnet_group_name          = try(each.value.subnet_group_name, null)
  create_subnet_group        = each.value.create_subnet_group
  subnet_group_description   = try(each.value.subnet_group_description, " ")
  subnet_ids                 = try(each.value.subnet_ids, [])

  create_parameter_group      = try(each.value.create_parameter_group, false)
  parameter_group_name        = try(each.value.parameter_group_name, null)
  parameter_group_description = try(each.value.parameter_group_description, "")
  parameter_group_family      = try(each.value.parameter_group_family, "")
  tags                        = {}

  #
  parameters = try(each.value.parameters, null)
}
