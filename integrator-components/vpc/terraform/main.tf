module "aws_vpc" {
  # source                               = "git@github-flouxtine:Flouxtine/aws-terraform-base-module.git//terraform-aws-vpc?ref=main"
  source                               = "git::https://github.com/Flouxtine/aws-terraform-base-module.git?ref=main"
  for_each                             = var.create_aws_vpc_config
  create_aws_vpc                       = each.value.create_aws_vpc
  cidr_block                           = each.value.cidr_block
  assign_generated_ipv6_cidr_block     = try(each.value.assign_generated_ipv6_cidr_block, null)
  enable_dns_hostnames                 = try(each.value.enable_dns_hostnames, null)
  enable_dns_support                   = try(each.value.enable_dns_support, null)
  enable_network_address_usage_metrics = try(each.value.enable_network_address_usage_metrics, null)
  instance_tenancy                     = try(each.value.instance_tenancy, null)
  ipv4_ipam_pool_id                    = try(each.value.ipv4_ipam_pool_id, null)
  ipv4_netmask_length                  = try(each.value.ipv4_netmask_length, null)
  ipv6_cidr_block                      = try(each.value.ipv6_cidr_block, null)
  ipv6_ipam_pool_id                    = try(each.value.ipv6_ipam_pool_id, null)
  ipv6_netmask_length                  = try(each.value.ipv6_netmask_length, null)
  tags                                 = try(merge(each.value.tags, var.global.tags), null)
}
module "aws_subnet" {
  source                                                    = "git::https://github.com/Flouxtine/aws-terraform-base-module.git?ref=main"
  for_each                                                  = var.create_aws_subnet_config
  create_aws_subnet                                         = each.value.create_aws_subnet
  aws_subnet_vpc_id                                         = each.value.vpc_id == null ? module.aws_vpc[each.value.vpc_id_depend_key].aws_vpc_id : each.value.vpc_id
  aws_subnet_cidr_block                                     = each.value.cidr_block
  aws_subnet_assign_ipv6_address_on_creation                = try(each.value.assign_ipv6_address_on_creation, null)
  aws_subnet_availability_zone                              = try(each.value.availability_zone, null)
  aws_subnet_availability_zone_id                           = try(each.value.availability_zone_id, null)
  aws_subnet_enable_dns64                                   = try(each.value.enable_dns64, null)
  aws_subnet_enable_lni_at_device_index                     = try(each.value.enable_lni_at_device_index, null)
  aws_subnet_enable_resource_name_dns_aaaa_record_on_launch = try(each.value.enable_resource_name_dns_aaaa_record_on_launch, null)
  aws_subnet_enable_resource_name_dns_a_record_on_launch    = try(each.value.enable_resource_name_dns_a_record_on_launch, null)
  aws_subnet_ipv6_cidr_block                                = try(each.value.ipv6_cidr_block, null)
  aws_subnet_ipv6_native                                    = try(each.value.ipv6_native, null)
  aws_subnet_map_public_ip_on_launch                        = try(each.value.map_public_ip_on_launch, null)
  aws_subnet_private_dns_hostname_type_on_launch            = try(each.value.private_dns_hostname_type_on_launch, null)
  aws_subnet_tags                                           = try(merge(each.value.tags, var.global.tags), null)
}
module "aws_route_table" {
  source   = "git::https://github.com/Flouxtine/aws-terraform-base-module.git?ref=main"
  for_each = var.create_aws_route_table_config

  create           = each.value.create_aws_route_table # 注意这里改成模块支持的参数名
  vpc_id           = each.value.vpc_id == null ? module.aws_vpc[each.value.vpc_id_depend_key].aws_vpc_id : each.value.vpc_id
  propagating_vgws = try(each.value.propagating_vgws, null)
  tags             = try(merge(each.value.tags, var.global.tags), null)
  routes           = try(each.value.route, null)
}
module "aws_route" {
  source   = "git::https://github.com/Flouxtine/aws-terraform-base-module.git//terraform-aws-vpc?ref=main"
  for_each = var.create_aws_route_config

  # 将 each.value.create_aws_route 映射到模块的 create
  create                      = each.value.create_aws_route
  route_table_id              = each.value.route_table_id == null ? module.aws_route_table[each.value.route_table_id_depend_key].aws_route_table_id : each.value.route_table_id
  carrier_gateway_id          = try(each.value.carrier_gateway_id, null)
  core_network_arn            = try(each.value.core_network_arn, null)
  destination_cidr_block      = try(each.value.destination_cidr_block, null)
  destination_ipv6_cidr_block = try(each.value.destination_ipv6_cidr_block, null)
  destination_prefix_list_id  = try(each.value.destination_prefix_list_id, null)
  egress_only_gateway_id      = try(each.value.egress_only_gateway_id, null)
  gateway_id                  = try(each.value.gateway_id, null)
  local_gateway_id            = try(each.value.local_gateway_id, null)
  nat_gateway_id              = try(each.value.nat_gateway_id, null)
  network_interface_id        = try(each.value.network_interface_id, null)
  transit_gateway_id          = try(each.value.transit_gateway_id, null)
  vpc_endpoint_id             = try(each.value.vpc_endpoint_id, null)
  vpc_peering_connection_id   = try(each.value.vpc_peering_connection_id, null)
}
module "aws_route_table_association" {
  source   = "git::https://github.com/Flouxtine/aws-terraform-base-module.git//terraform-aws-vpc?ref=main"
  for_each = var.create_aws_route_table_association_config

  create         = each.value.create_aws_route_table_association
  route_table_id = each.value.route_table_id == null ? module.aws_route_table[each.value.route_table_id_depend_key].aws_route_table_id : each.value.route_table_id
  region         = try(each.value.region, null)
  subnet_id      = each.value.subnet_id == null ? module.aws_subnet[each.value.subnet_id_depend_key].aws_subnet_id : each.value.subnet_id
  gateway_id     = try(each.value.gateway_id, null)
}
