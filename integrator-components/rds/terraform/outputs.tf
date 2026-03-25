output "aws_rds_endpoint" {
  value = { for k, v in module.rds : k => v.rds_endpoint }
}

output "aws_rds_arn" {
  value = { for k, v in module.rds : k => v.rds_arn }
}