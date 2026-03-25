include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../../integrator-components/${local.component}/terraform"

  before_hook "tag_version" {
    commands = ["apply", "plan"]
    execute  = ["echo", "Current tag version:", local.tag, "Component name:", local.component]
  }

  after_hook "post_component_info" {
    commands = ["apply"]
    execute  = ["echo",local.component, local.tag]
  }
  //指定的terraform command中添加额外的配置
  extra_arguments "custom_vars" {
    commands = [
      "plan",
      "import",
      "push",
      "refresh",
      "destroy",
    ]

    arguments = [
      "-var-file=${get_parent_terragrunt_dir()}/global.tfvars",
      "-var-file=terraform.tfvars"
    ]
  }
}

locals {
  version_vars    = read_terragrunt_config("versions.hcl")
  components_vars = read_terragrunt_config(find_in_parent_folders("components.hcl"))
  tag             = local.version_vars.locals[basename(get_terragrunt_dir())]
  component       = local.components_vars.locals[basename(get_terragrunt_dir())]
}

# dependency "vpc" {
#   config_path = "../vpc"
# }


inputs = {
  create_rds_config = {
    aws-wukong-uat-mysql-01  = {
      create_db_instance              = true
      create_cloudwatch_log_group     = false
      create_db_parameter_group       = true
      create_db_subnet_group          = true
      username                        = "root"
      password                        = "ZKBNWqBV7cUi0BD93rkF"
      identifier                      = "aws-wukong-uat-mysql-01"
      db_subnet_group_name            = "aws-wukong-uat-mysql-subnetgroup01"
      subnet_group_description        = "aws-wukong-uat-mysql-subnetgroup01"
      parameter_group_name            = "aws-wukong-uat-mysql-params-01"
      engine                          = "mysql"
      subnet_ids                      = ["subnet-03a0dea2a528c3bb6", "subnet-06765c7a7291adbc7"]
      instance_class                  = "db.m6g.2xlarge"
      storage_encrypted               = true
      allocated_storage               = 200
      enabled_cloudwatch_logs_exports = ["error", "slowquery"]
      parameter_group_description     = "aws-wukong-uat-mysql-01"
      family                          = "mysql8.0"
      auto_minor_version_upgrade      = false
      copy_tags_to_snapshot           = true
      monitoring_interval             = 60
      performance_insights_enabled    = true
      skip_final_snapshot             = true
      monitoring_role_arn             = "arn:aws:iam::863518445962:role/rds-monitoring-role"
      tags                            = {
        Name = "aws-wukong-uat-mysql-01"
        project = "wukong"
        env     = "uat"
        Mcd-Project = "wukong"
        project_owner = ""
        created      = "terraform"
      }
    }
  }
}
