module "msk" {
  for_each = var.create_msk_config
  source   = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-msk?ref=main"

  kafka_version                   = each.value.kafka_version
  broker_node_instance_type       = each.value.broker_node_instance_type
  number_of_broker_nodes          = each.value.number_of_broker_nodes
  broker_node_storage_info        = try(each.value.broker_node_storage_info, null)
  name                            = each.value.name
  kms_multi_region                = try(each.value.kms_multi_region, null)
  kms_policy                      = try(jsondecode(each.value.kms_policy), null)
  broker_node_client_subnets      = each.value.broker_node_client_subnets
  broker_node_security_groups     = each.value.broker_node_security_groups
  client_authentication           = try(each.value.client_authentication, {})
  configuration_name              = each.value.configuration_name
  configuration_server_properties = each.value.configuration_server_properties
  kms_alias_name                  = try(each.value.kms_alias_name, null)
  configuration_revision          = try(each.value.configuration_revision, 0)
  tags                            = try(each.value.tags, {})

}


