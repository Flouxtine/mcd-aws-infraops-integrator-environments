bucket_name       = "my-bucket-zhangzh-uat"
force_destroy     = true
enable_versioning = true

table_name   = "my-table-zhangzh-uat"
billing_mode = "PAY_PER_REQUEST"
hash_key     = "LockID"
attributes = [
  {
    name = "LockID"
    type = "S"
  }
]

tags = {
  Environment = "uat"
  Component   = "s3-dynamodb"
}
