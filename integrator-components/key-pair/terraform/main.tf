module "aws_key_pair" {
  source              = "git::ssh://git@github.com/AWS-TEST/aws-terraform-base-module.git//terraform-aws-key-pair"
  for_each            = var.create_aws_key_pair_config
  create_aws_key_pair = each.value.create_aws_key_pair
  public_key          = each.value.public_key
  region              = try(each.value.region, null)
  key_name            = try(each.value.key_name, null)
  key_name_prefix     = try(each.value.key_name_prefix, null)
  tags                = try(merge(each.value.tags, var.global.tags), null)
}
