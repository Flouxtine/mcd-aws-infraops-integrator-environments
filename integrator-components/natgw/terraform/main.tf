module "nagtw" {

  for_each          = var.create_natgw_config
  source            = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-nat-gateway?ref=main"
  connectivity_type = try(each.value.connectivity_type, null)
  name              = try(each.value.name, null)
  subnet_id         = try(each.value.subnet_id, null)
  allocation_id     = try(each.value.allocation_id, null)
  tags              = try(each.value.tags, {})
}
