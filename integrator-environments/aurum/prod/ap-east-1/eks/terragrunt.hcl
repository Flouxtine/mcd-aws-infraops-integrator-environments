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

dependency "alt" {
  config_path = "../aws-launch-template"
}


inputs = {
  create_eks_config = {
    aws-aurum-prod-eks-01 = {
      cluster_name                  = "aws-aurum-prod-eks-01"
      cluster_role_arn              = "arn:aws:iam::863518445962:role/EKSClusterRole"
      kubernetes_version            = "1.34"
      bootstrap_self_managed_addons = false
      subnet_ids = [
        "subnet-029aa5fd6ad2fec54", "subnet-05d356a1d6ce229dc", "subnet-08d737a8a100cb592", "subnet-0548ccf76f730a949"
      ]
      enabled_cluster_log_types                   = []
      authentication_mode                         = "API_AND_CONFIG_MAP"
      bootstrap_cluster_creator_admin_permissions = true
      vpc_id                                      = "vpc-0785d258a60e20345"
      # cluster_security_group_ids                  = ["sg-01be2e1593d34530b"]
      cluster_endpoint_private_access             = false
      cluster_endpoint_public_access              = true
      cluster_endpoint_public_access_cidrs        = ["0.0.0.0/0"]
      kubernetes_service_ipv4_cidr                = "172.20.0.0/16"
      elastic_load_balancing_enabled              = false
      enabled_cluster_log_types                   = []
      upgrade_policy = {
        support_type = "EXTENDED"
      }
      zonal_shift_config_enable = false
      tags = {
        project = "aurum"
        env     = "prod"
        Mcd-Project = "aurum"
        project_owner = ""
        created      = "terraform"
      }


      addons = {
        "vpc-cni" = {
          version = "v1.20.4-eksbuild.1"
        },
        "kube-proxy" = {
          version = "v1.34.0-eksbuild.2"
        },
        "aws-ebs-csi-driver" = {
          version = "v1.51.1-eksbuild.1"
          pod_identity_association = {
            role_arn        = "arn:aws:iam::863518445962:role/AmazonEKSPodIdentityAmazonEBSCSIRole"
            service_account = "ebs-csi-controller-sa"
          }
        },
        "metrics-server" = {
          version = "v0.8.0-eksbuild.2"
        },
        "eks-pod-identity-agent" = {
          version = "v1.3.9-eksbuild.5"
        },
        "coredns" = {
          version = "v1.12.4-eksbuild.1"
        }
      }

      node_groups = {
        "nodegroup01" = {
          node_group_name = "nodegroup01"
          node_role_arn   = "arn:aws:iam::863518445962:role/EKSNodeGroupRole"
          instance_types  = ["c7i.xlarge"]
          scaling_config = {
            desired_size = 2
            max_size     = 2
            min_size     = 1
          }
          labels = {
            "role"                           = "workers"
          }
          tags = {
            project = "aurum"
            env     = "prod"
            Mcd-Project = "aurum"
            project_owner = ""
            created      = "terraform"
          }
          ami_type        = "AL2023_x86_64_STANDARD"
          launch_template = {
            nodegroup01 = {
              id      = dependency.alt.outputs.aws_launch_template_output["eksctl-aws-aurum-prod-eks-01-nodegroup-nodegroup01"].aws_launch_template_id
              name    = "eksctl-aws-aurum-prod-eks-01-nodegroup-nodegroup01"
              version = 1
            }
          }
        }
      }
    }

  }
}
