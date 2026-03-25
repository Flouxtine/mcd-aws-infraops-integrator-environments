create_aws_security_group_config = {
  aws-uat-deltaglobalorderserv-sg-msk-01 = {
    create_aws_security_group 	=  	true
    name                        =   "aws-uat-deltaglobalorderserv-sg-msk-01"
    description             	=  	"aws-uat-deltaglobalorderserv-sg-msk-01"
    vpc_id                      =   "vpc-0ae1d5c4300550a78"
    tags                    	=  	{
      project = "deltaglobal-orderserv"
      env     = "uat"
      Mcd-Project = "deltaglobal-orderserv"
      project_owner = ""
      created      = "terraform"
    }
  }
}