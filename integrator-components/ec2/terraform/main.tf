data "aws_subnets" "by_name" {
  for_each = {
    for k, v in var.create_ec2_config : k => v
    if try(v.subnet_id, null) == null && try(v.subnet_name, null) != null
  }

  filter {
    name   = "tag:Name"
    values = [each.value.subnet_name]
  }
}

data "aws_security_groups" "by_names" {
  for_each = {
    for k, v in var.create_ec2_config : k => v
    if try(v.vpc_security_group_ids, null) == null && try(length(v.vpc_security_group_names), 0) > 0
  }

  filter {
    name   = "tag:Name"
    values = each.value.vpc_security_group_names
  }
}

module "ec2" {

  for_each = var.create_ec2_config
  source   = "git::ssh://github-flouxtine:Flouxtine/aws-terraform-base-module.git//terraform-aws-ec2?ref=main"

  # General Configuration
  create = try(each.value.create, true)
  name   = each.value.name
  tags   = try(each.value.tags, {})

  # AMI Configuration
  ami                = try(each.value.ami, null)
  ami_ssm_parameter  = try(each.value.ami_ssm_parameter, "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2")
  ignore_ami_changes = try(each.value.ignore_ami_changes, false)

  # Instance Configuration
  instance_type                        = try(each.value.instance_type, "t3.micro")
  availability_zone                    = try(each.value.availability_zone, null)
  key_name                             = try(each.value.key_name, null)
  monitoring                           = try(each.value.monitoring, null)
  ebs_optimized                        = try(each.value.ebs_optimized, null)
  disable_api_termination              = try(each.value.disable_api_termination, null)
  disable_api_stop                     = try(each.value.disable_api_stop, null)
  instance_initiated_shutdown_behavior = try(each.value.instance_initiated_shutdown_behavior, null)
  get_password_data                    = try(each.value.get_password_data, null)
  hibernation                          = try(each.value.hibernation, null)
  host_id                              = try(each.value.host_id, null)
  tenancy                              = try(each.value.tenancy, null)
  placement_group                      = try(each.value.placement_group, null)
  enclave_options_enabled              = try(each.value.enclave_options_enabled, null)
  maintenance_options                  = try(each.value.maintenance_options, {})
  capacity_reservation_specification   = try(each.value.capacity_reservation_specification, {})

  # CPU Options
  cpu_credits          = try(each.value.cpu_credits, null)
  cpu_options          = try(each.value.cpu_options, {})
  cpu_core_count       = try(each.value.cpu_core_count, null)
  cpu_threads_per_core = try(each.value.cpu_threads_per_core, null)

  # Network Configuration
  subnet_id                   = coalesce(try(each.value.subnet_id, null), try(data.aws_subnets.by_name[each.key].ids[0], null))
  associate_public_ip_address = try(each.value.associate_public_ip_address, null)
  private_ip                  = try(each.value.private_ip, null)
  source_dest_check           = try(each.value.source_dest_check, null)
  vpc_security_group_ids      = coalesce(try(each.value.vpc_security_group_ids, null), try(data.aws_security_groups.by_names[each.key].ids, null))
  secondary_private_ips       = try(each.value.secondary_private_ips, null)
  ipv6_address_count          = try(each.value.ipv6_address_count, null)
  ipv6_addresses              = try(each.value.ipv6_addresses, null)
  network_interface           = try(each.value.network_interface, [])
  private_dns_name_options    = try(each.value.private_dns_name_options, {})

  # Storage Configuration
  root_block_device      = try(each.value.root_block_device, [])
  ebs_block_device       = try(each.value.ebs_block_device, [])
  ephemeral_block_device = try(each.value.ephemeral_block_device, [])
  volume_tags            = try(each.value.volume_tags, {})
  enable_volume_tags     = try(each.value.enable_volume_tags, true)

  # User Data
  user_data                   = try(each.value.user_data, null)
  user_data_base64            = try(each.value.user_data_base64, null)
  user_data_replace_on_change = try(each.value.user_data_replace_on_change, null)

  # Metadata Options
  metadata_options = try(each.value.metadata_options, {
    "http_endpoint"               = "enabled"
    "http_put_response_hop_limit" = 1
    "http_tokens"                 = "optional"
  })

  # IAM Instance Profile
  create_iam_instance_profile   = try(each.value.create_iam_instance_profile, false)
  iam_instance_profile          = try(each.value.iam_instance_profile, null)
  iam_role_name                 = try(each.value.iam_role_name, null)
  iam_role_use_name_prefix      = try(each.value.iam_role_use_name_prefix, true)
  iam_role_path                 = try(each.value.iam_role_path, null)
  iam_role_description          = try(each.value.iam_role_description, null)
  iam_role_permissions_boundary = try(each.value.iam_role_permissions_boundary, null)
  iam_role_policies             = try(each.value.iam_role_policies, {})
  iam_role_tags                 = try(each.value.iam_role_tags, {})

  # Elastic IP
  create_eip = try(each.value.create_eip, false)
  eip_domain = try(each.value.eip_domain, "vpc")
  eip_tags   = try(each.value.eip_tags, {})

  # Spot Instance Configuration
  create_spot_instance                = try(each.value.create_spot_instance, false)
  spot_price                          = try(each.value.spot_price, null)
  spot_wait_for_fulfillment           = try(each.value.spot_wait_for_fulfillment, null)
  spot_type                           = try(each.value.spot_type, null)
  spot_launch_group                   = try(each.value.spot_launch_group, null)
  spot_block_duration_minutes         = try(each.value.spot_block_duration_minutes, null)
  spot_instance_interruption_behavior = try(each.value.spot_instance_interruption_behavior, null)
  spot_valid_until                    = try(each.value.spot_valid_until, null)
  spot_valid_from                     = try(each.value.spot_valid_from, null)

  # Launch Template
  launch_template = try(each.value.launch_template, {})

  # Timeouts
  timeouts = try(each.value.timeouts, {})

  # Instance Tags (merged with general tags if needed, module handles merging internally)
  instance_tags = try(each.value.instance_tags, {})

  # Controversial variable from source module
}

# output "all_summary" {
#   value = module.ec
# }
