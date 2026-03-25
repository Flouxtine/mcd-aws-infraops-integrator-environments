module "this" {
  source                      = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-dynamodb?ref=main"
  for_each                    = var.create_terraform-aws-dynamodb_config
  create_aws_dynamodb_table   = each.value.create_aws_dynamodb_table
  name                        = each.value.name
  hash_key                    = each.value.hash_key
  billing_mode                = try(each.value.billing_mode, null)
  read_capacity               = try(each.value.read_capacity, null)
  write_capacity              = try(each.value.write_capacity, null)
  stream_enabled              = try(each.value.stream_enabled, null)
  stream_view_type            = try(each.value.stream_view_type, null)
  range_key                   = try(each.value.range_key, null)
  table_class                 = try(each.value.table_class, null)
  tags                        = try(each.value.tags, null)
  deletion_protection_enabled = try(each.value.deletion_protection_enabled, null)
  restore_date_time           = try(each.value.restore_date_time, null)
  restore_source_name         = try(each.value.restore_source_name, null)
  restore_to_latest_time      = try(each.value.restore_to_latest_time, null)
  attribute                   = try(each.value.attribute, null)
  global_secondary_index      = try(each.value.global_secondary_index, null)
  local_secondary_index       = try(each.value.local_secondary_index, null)
  point_in_time_recovery      = try(each.value.point_in_time_recovery, null)
  on_demand_throughput        = try(each.value.on_demand_throughput, null)
  replica                     = try(each.value.replica, null)
  server_side_encryption      = try(each.value.server_side_encryption, null)
  ttl                         = try(each.value.ttl, null)
  import_table                = try(each.value.import_table, null)
}
