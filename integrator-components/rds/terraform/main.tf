module "rds" {
  for_each                        = var.create_rds_config
  source                          = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-rds-instance?ref=main"
  engine                          = try(each.value.engine, null)
  engine_version                  = try(each.value.engine_version, null)
  username                        = try(each.value.username, null)
  password                        = try(each.value.password, null)
  monitoring_role_arn             = try(each.value.monitoring_role_arn, null)
  identifier                      = try(each.value.identifier, null)
  instance_class                  = try(each.value.instance_class, null)
  storage_encrypted               = try(each.value.storage_encrypted, null)
  allocated_storage               = try(each.value.allocated_storage, null)
  enabled_cloudwatch_logs_exports = try(each.value.enabled_cloudwatch_logs_exports, null)
  create_db_instance              = try(each.value.create_db_instance, null)
  create_db_subnet_group          = try(each.value.create_db_subnet_group, null)
  db_subnet_group_name            = try(each.value.db_subnet_group_name, null)
  subnet_ids                      = try(each.value.subnet_ids, null)
  multi_az                        = try(each.value.multi_az, null)
  create_db_parameter_group       = try(each.value.create_db_parameter_group, null)
  tags                            = try(each.value.tags, {})
  family                          = try(each.value.family, null)
  subnet_group_description        = try(each.value.subnet_group_description, null)
  parameter_group_description     = try(each.value.parameter_group_description, null)
  create_cloudwatch_log_group     = try(each.value.create_cloudwatch_log_group, null)
  parameter_group_name            = try(each.value.parameter_group_name, null)
  db_name                         = try(each.value.db_name, null)

  auto_minor_version_upgrade   = try(each.value.auto_minor_version_upgrade, null)
  copy_tags_to_snapshot        = try(each.value.copy_tags_to_snapshot, null)
  monitoring_interval          = try(each.value.monitoring_interval, null)
  performance_insights_enabled = try(each.value.performance_insights_enabled, null)
  skip_final_snapshot          = try(each.value.skip_final_snapshot, null)
}


