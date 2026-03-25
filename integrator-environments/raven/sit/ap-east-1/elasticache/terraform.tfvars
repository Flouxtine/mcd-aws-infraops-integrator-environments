create_elasticache_map = {
  aws-sit-raven-redis-01 =  {
    create                      = true
    create_replication_group    = true
    node_type                   = "cache.t4g.small"
    engine_version              = "7.1"
    cluster_mode                = "enabled"
    cluster_mode_enabled        = true
    num_cache_nodes             = 3
    replicas_per_node_group     = 1
    replication_group_id        = "aws-sit-raven-redis-01"
    automatic_failover_enabled  = true
    multi_az_enabled            = true
    transit_encryption_enabled  = true
    snapshot_retention_limit    = 7
    # security_group_ids          = ["subnet-06765c7a7291adbc7","subnet-06765c7a7291adbc7"]
    subnet_group_name           = "aws-sit-raven-redis-subnetgroup01"
    create_subnet_group         = true
    subnet_ids                  = ["subnet-0b1b7ae63d9e70bc0", "subnet-007be61e78b32ed96"]
    subnet_group_description    = " "
    create_parameter_group      = true
    parameter_group_name        = "aws-sit-raven-redis-clusterparams-01"
    parameter_group_description = "aws-sit-raven-redis-clusterparams-01"
    parameter_group_family      = "redis7"
    tags                        = {
      project = "raven"
      env     = "sit"
      Mcd-Project = "INFRA-SIT-Raven"
      project_owner = ""
      created      = "terraform"
    }
    parameters                  = [{
      name      = "cluster-enabled"
      value     = "yes"
    }]
  }
}