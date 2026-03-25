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



inputs = {
}
