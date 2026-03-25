output "aws_nat_gateway_id" {
  value = { for k, v in module.nagtw : k => v.nat_gateway_id }
}

output "aws_nat_gateway_public_ip" {
  value = { for k, v in module.nagtw : k => v.public_ip }
}