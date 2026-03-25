remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-backend-state-ap-east-1"
    key            = "aurum/prod/ap-east-1/${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock-table"
  }
}