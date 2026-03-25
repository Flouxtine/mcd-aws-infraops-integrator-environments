variable "global" {
  type        = any
  description = "Global parameters"
}


variable "create_natgw_config" {
  type        = map(any)
  description = "Configuration for creating NAT Gateways."
}
