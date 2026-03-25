variable "global" {
  type        = any
  default     = {}
  description = "Global params"
}
variable "create_terraform-aws-s3_config" {
  description = "create resource terraform-aws-s3 all params"
  default     = {}
  type = map(object({
    create_aws_s3_bucket                                                     = optional(bool, false)
    bucket                                                                   = optional(string, null)
    bucket_prefix                                                            = optional(string, null)
    force_destroy                                                            = optional(bool, null)
    tags                                                                     = optional(map(string), {})
    create_aws_s3_bucket_server_side_encryption_configuration                = optional(bool, false)
    aws_s3_bucket_server_side_encryption_configuration_bucket                = optional(string, null)
    aws_s3_bucket_server_side_encryption_configuration_expected_bucket_owner = optional(string, null)
    aws_s3_bucket_server_side_encryption_configuration_rule                  = optional(map(any), {})
    create_aws_s3_bucket_versioning                                          = optional(bool, false)
    aws_s3_bucket_versioning_bucket                                          = optional(string, null)
    aws_s3_bucket_versioning_expected_bucket_owner                           = optional(string, null)
    aws_s3_bucket_versioning_mfa                                             = optional(string, null)
    aws_s3_bucket_versioning_versioning_configuration                        = optional(map(any), {})
    })
  )
}
