output "aws_opensearch_domain_arn" {
  value = { for k, v in module.opensearch : k => v.domain_arn }
}

output "aws_opensearch_domain_endpoint" {
  value = { for k, v in module.opensearch : k => v.domain_endpoint }
}

output "aws_opensearch_domain_id" {
  value = { for k, v in module.opensearch : k => v.domain_id }
}