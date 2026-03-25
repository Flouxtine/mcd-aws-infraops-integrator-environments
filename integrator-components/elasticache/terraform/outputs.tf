
output "aws_elasticache_replication_group_arn" {
  value = { for k, v in module.redis : k => v.replication_group_arn }
}

output "aws_elasticache_replication_group_id" {
  value = { for k, v in module.redis : k => v.replication_group_id }
}

output "replication_group_configuration_endpoint_address" {
  value = { for k, v in module.redis : k => v.replication_group_configuration_endpoint_address }
}