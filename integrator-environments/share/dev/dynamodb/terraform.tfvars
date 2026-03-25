create_terraform-aws-dynamodb_config = {
  terraform-state-dynamodb = {
    create_aws_dynamodb_table = true
    name                      = "terraform-state-lock-table"
    billing_mode              = "PAY_PER_REQUEST"
    hash_key                  = "LockID"
    attribute = {
      lock = {
        name = "LockID"
        type = "S"
      }
    }
  }
}