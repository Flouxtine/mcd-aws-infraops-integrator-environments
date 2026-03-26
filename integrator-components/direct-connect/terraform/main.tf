module "this" {
  source                                     = "git::ssh://github-flouxtine:Flouxtine/aws-terraform-base-module.git//terraform-aws-direct-connect?ref=main"
  for_each                                   = var.create_resource_config
  create_aws_dx_gateway                      = each.value.create_aws_dx_gateway
  name                                       = each.value.name
  amazon_side_asn                            = each.value.amazon_side_asn
  tags                                       = try(each.value.tags, null)
  aws_dx_private_virtual_interface_config    = try(each.value.aws_dx_private_virtual_interface_config, {})
  aws_dx_transit_virtual_interface_config    = try(each.value.aws_dx_transit_virtual_interface_config, {})
  aws_dx_gateway_association_config          = try(each.value.aws_dx_gateway_association_config, {})
  aws_dx_gateway_association_proposal_config = try(each.value.aws_dx_gateway_association_proposal_config, {})
  aws_dx_connection_config                   = try(each.value.aws_dx_connection_config, {})
}
