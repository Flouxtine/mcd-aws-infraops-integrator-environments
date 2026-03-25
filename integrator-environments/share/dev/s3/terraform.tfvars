create_terraform-aws-s3_config = {
  mcd-terraform-state-ap-east-1 = {
    create_aws_s3_bucket = true
    bucket               = "terraform-backend-state-ap-east-1"
    tags = {
      name = "terraform-backend-state-ap-east-1"
    }
    create_aws_s3_bucket_versioning = true
    aws_s3_bucket_versioning_versioning_configuration = {
      status = "Enabled"
    }
    create_aws_s3_bucket_server_side_encryption_configuration = true
    aws_s3_bucket_server_side_encryption_configuration_rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = "arn:aws:kms:ap-east-1:863518445962:alias/aws/s3"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}