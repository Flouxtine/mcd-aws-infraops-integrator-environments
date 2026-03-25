include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../../integrator-components/${local.component}/terraform"

  before_hook "tag_version" {
    commands = ["apply", "plan"]
    execute = ["echo", "Current tag version:", local.tag, "Component name:", local.component]
  }

  after_hook "post_component_info" {
    commands = ["apply"]
    execute = ["echo", local.component, local.tag]
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
  version_vars = read_terragrunt_config("versions.hcl")
  components_vars = read_terragrunt_config(find_in_parent_folders("components.hcl"))
  tag       = local.version_vars.locals[basename(get_terragrunt_dir())]
  component = local.components_vars.locals[basename(get_terragrunt_dir())]
}

dependency "key_pair" {
  config_path = "../aws-key-pair"
}

inputs = {
  create_aws_launch_template_config = {
    eksctl-aws-bossfoundation-uat-eks-01-nodegroup-nodegroup01 = {
      create_aws_launch_template = true
      name                       = "eksctl-aws-bossfoundation-uat-eks-01-nodegroup-nodegroup01"
      region                     = "ap-east-1"
      key_name                   = dependency.key_pair.outputs.aws_key_pair_output["aws-bossfoundation-uat-key-eks-01"].aws_key_pair_key_name
      block_device_mappings = [
        {
          device_name = "/dev/xvda"
          ebs = [
            {
              encrypted   = "true"
              iops        = 2000
              throughput  = 125
              volume_size = 200
              volume_type = "gp3"
            }
          ]
        }
      ]
      metadata_options = [
        {
          http_put_response_hop_limit = 2
          http_tokens                 = "required"
        },
      ]
      tags = {
        project       = "bossfoundation"
        env           = "uat"
        Mcd-Project   = "bossfoundation"
        project_owner = ""
        created       = "terraform"
      }
      tag_specifications = [
        {
          resource_type = "instance"
          tags = {
            Name          = "aws-bossfoundation-uat-eks-01-nodegroup01-Node"
            project       = "bossfoundation"
            env           = "uat"
            Mcd-Project   = "bossfoundation"
            project_owner = ""
            created       = "terraform"
          }
        }
      ]
    }
  }
}
