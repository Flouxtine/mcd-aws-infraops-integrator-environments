# This file is auto-generated. Do not edit manually.
terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.92.0"
    }
  }
}
provider "aws" {
  region = local.region
}
