# provider.tf
provider "aws" {
  region = var.region != "" ? var.region : (var.global != null ? var.global.regions["ea"] : "ap-east-1")
  # 如果你需要从环境变量或 IAM 角色自动获取凭证，只需设置 region 即可，无需显式提供 access_key/secret_key。
  # 如果使用 LocalStack 本地测试，可以通过以下方式配置：
  # endpoints {
  #   s3 = "http://localhost:4566"
  #   dynamodb = "http://localhost:4566"
  # }
  # skip_credentials_validation = true
  # s3_use_path_style = true
}
