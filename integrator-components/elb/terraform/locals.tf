locals {
  region = var.global.regions["ea"]
  create_lb_config = {
    for k, v in var.create_lb_config : k =>
    merge(
      v,
      # var.lb_security_groups != [] ? { security_groups = var.lb_security_groups } : {},
      # local.subnet_mappings != [] && local.subnet_mappings != [] ? { subnet_mappings = local.subnet_mappings } : {},
      length(try(v.default_action_forward, {})) == 0 ? { default_action_forward = local.default_action_forward } : {}
    )
  }
  subnet_mappings = [for v in var.subnet_ids : { subnet_id = v }]

  //新建的target_group
  create_target_group_arn = {
    for k, v in try(module.target_group.target_group_arns, {}) : k => {
      arn = v, weight = 0
    } if var.create_lb_target_group_config != {}
  }
  //传递的target_group
  target_group_arn = [
    for v in var.lb_target_group_arn : {
      arn = v, weight = 0
    }
  ]

  default_action_forward = {
    target_groups = length(local.target_group_arn) == 0 ? values(local.create_target_group_arn) : local.target_group_arn
    stickiness    = var.target_group_stickiness
  }

  create_lb_target_group_config = {
    for k, v in var.create_lb_target_group_config : k =>
    merge(v, var.vpc_id != null && try(v.vpc_id, null) == null ? { vpc_id = var.vpc_id } : {})
  }
  create_lb_listener_config = {
    for k, v in var.create_lb_listener_config : k => merge(v, { default_action_forward = merge(v.default_action_forward, {
      target_groups = [
        for tg in v.default_action_forward.target_groups : merge(tg,
        { arn = try(tg.arn, module.target_group.target_group_arns[v.default_action_target_group_name]) })
      ]
    }) })
  }
}