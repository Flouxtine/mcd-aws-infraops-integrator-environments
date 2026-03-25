
output "aws_msk_cluster_arn" {
  value = { for k, v in module.msk : k => v.msk_cluster_arn }
}

output "aws_msk_bootstrap_brokers" {
  value = { for k, v in module.msk : k => v.msk_bootstrap_brokers }
}