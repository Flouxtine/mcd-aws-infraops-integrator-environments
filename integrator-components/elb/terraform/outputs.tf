
output "aws_elb_arn" {
  value = { for k, v in module.this : k => v.load_balancer_arn }
}

output "aws_elb_listener_arn" {
  value = { for k, v in module.this : k => v.listener_arn }
}

output "aws_elb_target_group_arns" {
  value = { for k, v in module.this : k => v.target_group_arns }
}