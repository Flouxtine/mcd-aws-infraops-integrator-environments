module "this" {
  source                                                 = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-transit-gateway?ref=main"
  for_each                                               = var.create_resource_config
  create_aws_ec2_transit_gateway                         = each.value.create_aws_ec2_transit_gateway
  amazon_side_asn                                        = try(each.value.amazon_side_asn, null)
  auto_accept_shared_attachments                         = try(each.value.auto_accept_shared_attachments, null)
  default_route_table_association                        = try(each.value.default_route_table_association, null)
  default_route_table_propagation                        = try(each.value.default_route_table_propagation, null)
  description                                            = try(each.value.description, null)
  dns_support                                            = try(each.value.dns_support, null)
  multicast_support                                      = try(each.value.multicast_support, null)
  transit_gateway_cidr_blocks                            = try(each.value.transit_gateway_cidr_blocks, null)
  tags                                                   = try(each.value.tags, null)
  vpn_ecmp_support                                       = try(each.value.vpn_ecmp_support, null)
  aws_ec2_transit_gateway_connect_config                 = try(each.value.aws_ec2_transit_gateway_connect_config, {})
  aws_ec2_transit_gateway_connect_peer_config            = try(each.value.aws_ec2_transit_gateway_connect_peer_config, {})
  aws_ec2_transit_gateway_vpc_attachment_config          = try(each.value.aws_ec2_transit_gateway_vpc_attachment_config, {})
  aws_ec2_transit_gateway_vpc_attachment_accepter_config = try(each.value.aws_ec2_transit_gateway_vpc_attachment_accepter_config, {})
}
