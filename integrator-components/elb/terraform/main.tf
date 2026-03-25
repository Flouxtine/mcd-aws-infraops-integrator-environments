module "this" {
  source                           = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-elb?ref=main"
  for_each                         = local.create_lb_config
  create_aws_lb                    = length(local.create_lb_config) > 0 ? true : false
  load_balancer_name               = each.value.load_balancer_name
  load_balancer_type               = each.value.load_balancer_type
  enable_cross_zone_load_balancing = each.value.enable_cross_zone_load_balancing
  # Optional parameters
  internal        = try(each.value.internal, false)
  security_groups = try(each.value.security_groups, [])
  subnet_mappings = try(each.value.subnet_mappings)
  tags            = try(each.value.tags, {})

  # //listener
  # create_aws_lb_listener          = length(local.create_lb_config) > 0 ? true : false
  # default_action_type             = try(each.value.default_action_type, "forward")
  # default_action_target_group_arn = try(each.value.default_action_target_group_arn, null)
  # listener_port                   = try(each.value.port, 80)
  # listener_protocol               = try(each.value.protocol, "http")
  # default_action_forward          = try(each.value.default_action_forward, {})
  # listener_tags                   = try(each.value.listener_tags, {})
}

module "listen" {
  source                          = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-elb?ref=main"
  for_each                        = local.create_lb_listener_config
  create_aws_lb_listener          = true
  load_balancer_arn               = try(each.value.load_balancer_arn, module.this[each.value.load_balancer_name].load_balancer_arn)
  default_action_type             = try(each.value.default_action_type, "forward")
  default_action_target_group_arn = try(module.target_group.target_group_arns[each.value.default_action_target_group_name], each.value.default_action_target_group_arn, null)
  listener_port                   = try(each.value.port, 80)
  listener_protocol               = try(each.value.protocol, "http")
  default_action_forward          = try(each.value.default_action_forward, {})
  listener_tags                   = try(each.value.listener_tags, {})
}

module "target_group" {
  source        = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-elb?ref=main"
  target_groups = local.create_lb_target_group_config
}
