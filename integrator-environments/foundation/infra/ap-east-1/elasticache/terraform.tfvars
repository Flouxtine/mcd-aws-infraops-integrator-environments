create_elasticache_map = {
  "aws-foundation-infra-redis-01" : {
    create                      = true
    create_replication_group    = true
    node_type                   = "cache.m6g.xlarge"
    engine_version              = "6.2"
    num_cache_nodes             = 2
    replication_group_id        = "aws-foundation-infra-redis-01"
    automatic_failover_enabled  = true
    multi_az_enabled            = true
    snapshot_retention_limit    = 7
    security_group_ids          = ["sg-0e170a75f811b70af"]
    subnet_group_name           = "aws-foundation-infra-redis-subnetgroup01"
    create_subnet_group         = true
    subnet_ids                  = ["subnet-011e8b0de384c9634", "subnet-0f2607f27d8c27196"]
    subnet_group_description    = "aws-foundation-infra-redis-subnetgroup01"
    create_parameter_group      = true
    parameter_group_name        = "aws-foundation-infra-redis-clusterparams-01"
    parameter_group_description = "aws-foundation-infra-redis-clusterparams-01"
    parameter_group_family      = "redis7"
    tags                        = {}
    parameters                  = [{
      name      = "cluster-enabled"
      value     = "yes"
    }]
  }
}