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
      "apply",
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


inputs = {
  create_elasticache_map = {
    aws-bossfoundation-test-redis-01 =  {
      create                      = true
      create_replication_group    = true
      node_type                   = "cache.m6g.xlarge"
      engine_version              = "7.1"
      cluster_mode                = "disabled"
      # num_cache_nodes             = 1
      replicas_per_node_group     = 2
      replication_group_id        = "aws-bossfoundation-test-redis-01"
      automatic_failover_enabled  = true
      multi_az_enabled            = true
      transit_encryption_enabled  = true
      snapshot_retention_limit    = 7
      security_group_ids          = ["sg-069211ca3460e277d"]
      subnet_group_name           = "aws-bossfoundation-test-redis-subnetgroup01"
      create_subnet_group         = true
      subnet_ids                  = ["subnet-03a0dea2a528c3bb6", "subnet-06765c7a7291adbc7"]
      subnet_group_description    = " "
      create_parameter_group      = true
      parameter_group_name        = "aws-bossfoundation-test-redis-clusterparams-01"
      parameter_group_description = "aws-bossfoundation-test-redis-clusterparams-01"
      parameter_group_family      = "redis7"
      tags                        = {
        project = "bossfoundation"
        env     = "test"
        Mcd-Project = "bossfoundation"
        project_owner = ""
        created      = "terraform"
      }
      parameters                  = [{
        name      = "cluster-enabled"
        value     = "no"
      }]
    }
  }
}
