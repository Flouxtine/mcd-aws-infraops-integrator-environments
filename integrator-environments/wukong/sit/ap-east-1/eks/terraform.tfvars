create_eks_config = {
  aws-wukong-sit-eks-01 = {
    cluster_name                  = "aws-wukong-sit-eks-01"
    cluster_role_arn              = "arn:aws:iam::863518445962:role/EKSClusterRole"
    version                       = "1.32"
    bootstrap_self_managed_addons = false
    subnet_ids = [
      "subnet-0548ccf76f730a949", "subnet-029aa5fd6ad2fec54", "subnet-05d356a1d6ce229dc", "subnet-08d737a8a100cb592"
    ]
    enabled_cluster_log_types                   = []
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
    vpc_id                                      = "vpc-0785d258a60e20345"
    cluster_security_group_ids                  = ["sg-01be2e1593d34530b"]
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
      "Mcd-Project"                                 = "wukong"
      "Name"                                        = "eksctl-aws-wukong-sit-eks-01-cluster/ControlPlane"
      "alpha.eksctl.io/cluster-name"                = "aws-wukong-sit-eks-01"
      "alpha.eksctl.io/cluster-oidc-enabled"        = "false"
      "alpha.eksctl.io/eksctl-version"              = "0.206.0"
      "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "aws-wukong-sit-eks-01"
      "env"                                         = "sit"
    }


    addons = {
      "vpc-cni" = {
        version = "v1.19.3-eksbuild.1"
      },
      "kube-proxy" = {
        version = "v1.32.0-eksbuild.2"
      },
      "aws-ebs-csi-driver" = {
        version = "v1.42.0-eksbuild.1"
        pod_identity_association = {
          role_arn        = "arn:aws:iam::863518445962:role/AmazonEKSPodIdentityAmazonEBSCSIRole"
          service_account = "ebs-csi-controller-sa"
        }
      },
      "metrics-server" = {
        version = "v0.7.2-eksbuild.3"
      },
      "eks-pod-identity-agent" = {
        version = "v1.3.5-eksbuild.2"
      },
      "coredns" = {
        version = "v1.11.4-eksbuild.2"
      }
    }

    node_groups = {
      "nodegroup01" = {
        node_group_name = "nodegroup01"
        node_role_arn   = "arn:aws:iam::863518445962:role/EKSNodeGroupRole"
        instance_types  = ["c6a.8xlarge"]
        scaling_config = {
          desired_size = 3
          max_size     = 3
          min_size     = 1
        }
        labels = {
          "alpha.eksctl.io/cluster-name"   = "aws-wukong-sit-eks-01"
          "alpha.eksctl.io/nodegroup-name" = "nodegroup01"
          "role"                           = "workers"
        }
        tags = {
          "Mcd-Project"                                 = "wukong"
          "alpha.eksctl.io/cluster-name"                = "aws-wukong-sit-eks-01"
          "alpha.eksctl.io/nodegroup-name"              = "nodegroup01"
          "alpha.eksctl.io/eksctl-version"              = "0.206.0"
          "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "aws-wukong-sit-eks-01"
          "alpha.eksctl.io/nodegroup-type"              = "managed"
          "env"                                         = "sit"
          "project"                                     = "wukong"
        }
        launch_template = {
          nodegroup01 = {
            id      = "lt-02b5409ab23807339"
            name    = "eksctl-aws-wukong-sit-eks-01-nodegroup-nodegroup01"
            version = 1
          }
        }
      }
    }
  }

}