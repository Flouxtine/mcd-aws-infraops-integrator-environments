create_elasticache_map = {
  "aws-wukongboss-sit-redis-01" : {
    create                      = true
    create_replication_group    = true
    node_type                   = "cache.r6g.large"
    engine_version              = "6.2"
    num_cache_nodes             = 2
    replication_group_id        = "aws-wukongboss-sit-redis-01"
    automatic_failover_enabled  = true
    multi_az_enabled            = true
    snapshot_retention_limit    = 7
    security_group_ids          = ["sg-037326ceb9ed8cba7"]
    subnet_group_name           = "aws-wukongboss-sit-redis-subnetgroup01"
    create_subnet_group         = true
    subnet_ids                  = ["subnet-011e8b0de384c9634", "subnet-0f2607f27d8c27196"]
    subnet_group_description    = " "
    create_parameter_group      = true
    parameter_group_name        = "aws-wukongboss-sit-redis-clusterparams-01"
    parameter_group_description = "aws-wukongboss-sit-redis-clusterparams-01"
    parameter_group_family      = "redis6.x"
    tags                        = {}
    parameters                  = [{
      name      = "cluster-enabled"
      value     = "yes"
    }]
  }
}