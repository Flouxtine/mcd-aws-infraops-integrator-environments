terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=1.17.180"
    }
  }
}
provider "aws" {
  region = local.region
}
