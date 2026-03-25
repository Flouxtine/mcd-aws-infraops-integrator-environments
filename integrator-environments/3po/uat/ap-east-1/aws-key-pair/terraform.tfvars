create_aws_key_pair_config = {
  aws-3poeks-uat-key-eks-01 = {
    create_aws_key_pair 	=  true
    public_key       	=  	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8RKD0IXOrfn4IKt3TO/TYtkEcl7EHJ5vA27+Q48nZU2IvIJbIk7TOxKoPTuIH1KvEHW8MqS59dreb+s/7Hg0CtExtwgJwaBv2pNGc56u5sZynC0GrP9KWNMeJ3WKmJkj37BCVQRoL6M4b/0OPLi//5vBC6JwMFAWMAw9cdcYkI6r2ymkHfgS8WXhEHGaS20LeV41FXXqU6STuPAq56IEZImPMLGqSQXxp776/KcrdBMsRL+eHEHM/QAu0h3f6T9+r0j1c4WpW2w6YO0xgDMHl+8Jcy0laQ9QkyXW2sVPcNeHrN+r92WqXRAi6j3022l4WWEnV+aP/posA0iEby83mdnlpLq3LkdNQBrv3ofPgOnJhrXtySyU4r8tTGNJOOzyyXfAIA4btuf4SC9XKvv+VGKg+z53FkCNYDM4t12POHaI3noBeSlIFukk7wZTyO9wHN4ty+muN7LZ3dOeB8Emc31qafaFdDju9boldh3eAifjq1pl+TQLPrio2W0NLG0E= wangjw@wangjwdeMacBook-Air.local"
    region           	=  	"ap-east-1"
    key_name         	=  	"aws-3poeks-uat-key-eks-01"
    tags             	=  	{
      Name  = "aws-3poeks-uat-key-eks-01"
      project       = "3PO"
      env           = "uat"
      Mcd-Project   = "TOC-UAT-3PO"
    }
  }
}