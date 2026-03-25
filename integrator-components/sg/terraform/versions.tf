terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.18.0"
    }
  }
}
provider "aws" {
  region = local.region
}
