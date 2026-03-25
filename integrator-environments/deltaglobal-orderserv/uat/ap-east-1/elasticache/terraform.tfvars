create_elasticache_map = {
  aws-uat-deltaglobalorderserv-redis-01 =  {
    create                      = true
    create_replication_group    = true
    node_type                   = "cache.t4g.medium"
    engine_version              = "7.1"
    cluster_mode                = "enabled"
    cluster_mode_enabled        = true
    num_cache_nodes             = 3
    replicas_per_node_group     = 1
    replication_group_id        = "aws-uat-deltaglobalorderserv-redis-01"
    automatic_failover_enabled  = true
    multi_az_enabled            = true
    transit_encryption_enabled  = true
    snapshot_retention_limit    = 7
    # security_group_ids          = ["subnet-06765c7a7291adbc7","subnet-06765c7a7291adbc7"]
    subnet_group_name           = "aws-uat-deltaglobalorderserv-redis-subnetgroup01"
    create_subnet_group         = true
    subnet_ids                  = ["subnet-06765c7a7291adbc7", "subnet-03a0dea2a528c3bb6"]
    subnet_group_description    = " "
    create_parameter_group      = true
    parameter_group_name        = "aws-uat-deltaglobalorderserv-redis-clusterparams-01"
    parameter_group_description = "aws-uat-deltaglobalorderserv-redis-clusterparams-01"
    parameter_group_family      = "redis7"
    tags                        = {
      project = "deltaglobal-orderserv"
      env     = "uat"
      Mcd-Project = "deltaglobal-orderserv"
      project_owner = ""
      created      = "terraform"
    }
    parameters                  = [{
      name      = "cluster-enabled"
      value     = "yes"
    }]
  }
}