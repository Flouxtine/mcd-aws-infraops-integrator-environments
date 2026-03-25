output "aws_instance_arn" {
  value = { for k, v in module.ec2 : k => try(v.arn, null) }
}

output "aws_instance_id" {
  value = { for k, v in module.ec2 : k => try(v.id, null) }
}