create_elasticache_map = {
  "aws-wukong-sit-redis-01" : {
    create                      = true
    create_replication_group    = true
    node_type                   = "cache.r6g.large"
    engine_version              = "6.2"
    num_cache_nodes             = 2
    replication_group_id        = "aws-wukong-sit-redis-01"
    automatic_failover_enabled  = true
    multi_az_enabled            = true
    snapshot_retention_limit    = 7
    security_group_ids          = ["sg-0473c02f1ecd1ba5f"]
    subnet_group_name           = "aws-wukong-sit-redis-subnetgroup01"
    create_subnet_group         = true
    subnet_ids                  = ["subnet-011e8b0de384c9634", "subnet-0f2607f27d8c27196"]
    subnet_group_description    = " "
    create_parameter_group      = true
    parameter_group_name        = "aws-wukong-sit-redis-clusterparams-01"
    parameter_group_description = "aws-wukong-sit-redis-clusterparams-01"
    parameter_group_family      = "redis6.x"
    tags                        = {}
    parameters                  = [{
      name      = "cluster-enabled"
      value     = "yes"
    }]
  }
}