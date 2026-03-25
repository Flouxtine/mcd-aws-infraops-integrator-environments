variable "global" {
  type        = any
  default     = {}
  description = "Global params"
}
variable "create_aws_security_group_rule_config" {
  description                   = "create resource aws_security_group_rule all params"
  default                       = {}
  type                          = map(object({
  	create_aws_security_group_rule 	=  	optional(bool,false)
  	to_port                       	=  	optional(number,null)
  	protocol                      	=  	optional(string,null)
  	type                          	=  	optional(string,null)
  	from_port                     	=  	optional(number,null)
  	security_group_id_depend_key  	=  	optional(string,null)
  	security_group_id             	=  	optional(string,null)
  	self                          	=  	optional(bool,null)
  	cidr_blocks                   	=  	optional(list(string),[])
  	prefix_list_ids               	=  	optional(list(string),[])
  	description                   	=  	optional(string,null)
  	ipv6_cidr_blocks              	=  	optional(list(string),[])
  	timeouts                      	=  	optional(list(any),[])
  })
)
}
variable "create_aws_security_group_config" {
  description             = "create resource aws_security_group all params"
  default                 = {}
  type                    = map(object({
  	create_aws_security_group 	=  	optional(bool,false)
  	description             	=  	optional(string,null)
	vpc_id                      =   optional(string,null)
	name	                    =   optional(string,null)
  	revoke_rules_on_delete  	=  	optional(bool,null)
  	tags                    	=  	optional(map(string),{})
  	timeouts                	=  	optional(list(any),[])
  })
)
}
variable "create_aws_vpc_endpoint_security_group_association_config" {
  description                   = "create resource aws_vpc_endpoint_security_group_association all params"
  default                       = {}
  type                          = map(object({
  	create_aws_vpc_endpoint_security_group_association 	=  	optional(bool,false)
  	security_group_id_depend_key  	=  	optional(string,null)
  	security_group_id             	=  	optional(string,null)
  	vpc_endpoint_id               	=  	optional(string,null)
  	replace_default_association   	=  	optional(bool,null)
  })
)
}
