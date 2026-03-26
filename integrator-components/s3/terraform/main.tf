module "this" {
  source                                                                   = "git::ssh://git@github-flouxtine/Flouxtine/aws-terraform-base-module.git//terraform-aws-s3?ref=main"
  for_each                                                                 = var.create_terraform-aws-s3_config
  create_aws_s3_bucket                                                     = each.value.create_aws_s3_bucket
  bucket                                                                   = each.value.bucket
  bucket_prefix                                                            = try(each.value.bucket_prefix, null)
  force_destroy                                                            = try(each.value.force_destroy, null)
  tags                                                                     = try(each.value.tags, null)
  create_aws_s3_bucket_server_side_encryption_configuration                = each.value.create_aws_s3_bucket_server_side_encryption_configuration
  aws_s3_bucket_server_side_encryption_configuration_bucket                = each.value.aws_s3_bucket_server_side_encryption_configuration_bucket
  aws_s3_bucket_server_side_encryption_configuration_expected_bucket_owner = try(each.value.aws_s3_bucket_server_side_encryption_configuration_expected_bucket_owner, null)
  aws_s3_bucket_server_side_encryption_configuration_rule                  = try(each.value.aws_s3_bucket_server_side_encryption_configuration_rule, null)
  create_aws_s3_bucket_versioning                                          = each.value.create_aws_s3_bucket_versioning
  aws_s3_bucket_versioning_bucket                                          = each.value.aws_s3_bucket_versioning_bucket
  aws_s3_bucket_versioning_expected_bucket_owner                           = try(each.value.aws_s3_bucket_versioning_expected_bucket_owner, null)
  aws_s3_bucket_versioning_mfa                                             = try(each.value.aws_s3_bucket_versioning_mfa, null)
  aws_s3_bucket_versioning_versioning_configuration                        = try(each.value.aws_s3_bucket_versioning_versioning_configuration, null)
}
