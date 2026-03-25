module "aws_security_group_rule" {
  source                         = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-security-group?ref=main"
  for_each                       = var.create_aws_security_group_rule_config
  create_aws_security_group_rule = each.value.create_aws_security_group_rule
  to_port                        = each.value.to_port
  protocol                       = each.value.protocol
  type                           = each.value.type
  from_port                      = each.value.from_port
  security_group_id              = each.value.security_group_id == null ? module.aws_security_group[each.value.security_group_id_depend_key].aws_security_group_id : each.value.security_group_id
  self                           = try(each.value.self, null)
  cidr_blocks                    = try(each.value.cidr_blocks, null)
  prefix_list_ids                = try(each.value.prefix_list_ids, null)
  description                    = try(each.value.description, null)
  ipv6_cidr_blocks               = try(each.value.ipv6_cidr_blocks, null)
  timeouts                       = try(each.value.timeouts, null)
}
module "aws_security_group" {
  source                                    = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-security-group?ref=main"
  for_each                                  = var.create_aws_security_group_config
  create_aws_security_group                 = each.value.create_aws_security_group
  aws_security_group_name                   = try(each.value.name, null)
  aws_security_group_vpc_id                 = try(each.value.vpc_id, null)
  aws_security_group_description            = try(each.value.description, null)
  aws_security_group_revoke_rules_on_delete = try(each.value.revoke_rules_on_delete, null)
  aws_security_group_tags                   = try(merge(each.value.tags, var.global.tags), null)
  aws_security_group_timeouts               = try(each.value.timeouts, null)
}
module "aws_vpc_endpoint_security_group_association" {
  source                                                                  = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-security-group?ref=main"
  for_each                                                                = var.create_aws_vpc_endpoint_security_group_association_config
  create_aws_vpc_endpoint_security_group_association                      = each.value.create_aws_vpc_endpoint_security_group_association
  aws_vpc_endpoint_security_group_association_security_group_id           = each.value.security_group_id == null ? module.aws_security_group[each.value.security_group_id_depend_key].aws_security_group_id : each.value.security_group_id
  aws_vpc_endpoint_security_group_association_vpc_endpoint_id             = each.value.vpc_endpoint_id
  aws_vpc_endpoint_security_group_association_replace_default_association = try(each.value.replace_default_association, null)
}
