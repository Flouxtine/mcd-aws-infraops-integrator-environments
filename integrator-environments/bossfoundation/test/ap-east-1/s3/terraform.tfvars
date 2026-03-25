create_terraform-aws-s3_config = {
  aws-bossfoundation-test-s3-01 = {
    create_aws_s3_bucket = true
    bucket               = "aws-bossfoundation-test-s3-01"
    tags = {
      name = "aws-bossfoundation-test-s3-01"
    }
  }
}