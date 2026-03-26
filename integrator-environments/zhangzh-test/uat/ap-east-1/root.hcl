remote_state {
  backend = "s3"
  config = {
    bucket         = "my-bucket-zhangzh-uat"
    key            = "zhangzh-test/uat/ap-east-1/${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-east-1"
    encrypt        = true
    dynamodb_table = "my-table-zhangzh-uat"
  }
    # 跳过 bucket 策略检查和管理
  skip_bucket_policy = true
}
