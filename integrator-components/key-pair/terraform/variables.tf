variable "global" {
  type        = any
  default     = {}
  description = "Global params"
}
variable "create_aws_key_pair_config" {
  description      = "create resource aws_key_pair all params"
  default          = {}
  type             = map(object({
  	create_aws_key_pair 	=  	optional(bool,false)
  	public_key       	=  	optional(string,null)
  	region           	=  	optional(string,null)
  	key_name         	=  	optional(string,null)
  	key_name_prefix  	=  	optional(string,null)
  	tags             	=  	optional(map(string),{})
  })
)
}
