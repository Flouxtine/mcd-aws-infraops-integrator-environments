module "opensearch" {
  for_each = var.create_opensearch_config
  source   = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-opensearch?ref=main"

  # 必需参数
  domain_name = each.value.domain_name

  # 可选参数（使用each.value中的值或模块默认值）
  engine_version = try(each.value.engine_version, null)

  cluster_config = {
    instance_type                 = try(each.value.cluster_config.instance_type, "r6g.large.search")
    instance_count                = try(each.value.cluster_config.instance_count, 2)
    dedicated_master_enabled      = try(each.value.cluster_config.dedicated_master_enabled, false)
    dedicated_master_count        = try(each.value.cluster_config.dedicated_master_count, 0)
    zone_awareness_enabled        = try(each.value.cluster_config.zone_awareness_enabled, true)
    availability_zone_count       = try(each.value.cluster_config.availability_zone_count, 2)
    multi_az_with_standby_enabled = try(each.value.cluster_config.multi_az_with_standby_enabled, false)
  }

  ebs_options = {
    ebs_enabled = try(each.value.ebs_options.ebs_enabled, true)
    volume_type = try(each.value.ebs_options.volume_type, "gp3")
    volume_size = try(each.value.ebs_options.volume_size, 100)
    iops        = try(each.value.ebs_options.iops, 3000)
  }

  encrypt_at_rest = {
    enabled    = try(each.value.encrypt_at_rest.enabled, true)
    kms_key_id = try(each.value.encrypt_at_rest.kms_key_id, null)
  }

  node_to_node_encryption = try(each.value.node_to_node_encryption, true)

  vpc_options = {
    enabled            = try(each.value.vpc_options.enabled, false)
    subnet_ids         = try(each.value.vpc_options.subnet_ids, [])
    security_group_ids = try(each.value.vpc_options.security_group_ids, [])
  }

  log_publishing_options = {
    enabled                  = try(each.value.log_publishing_options.enabled, false)
    log_type                 = try(each.value.log_publishing_options.log_type, "INDEX_SLOW_LOGS")
    cloudwatch_log_group_arn = try(each.value.log_publishing_options.cloudwatch_log_group_arn, null)
  }


  access_policies = try(each.value.access_policies, null)
  tags            = try(each.value.tags, {})
}
