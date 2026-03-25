create_elasticache_map = {
  "aws-wukongboss-dev-redis-01" : {
    create                      = true
    create_replication_group    = true
    node_type                   = "cache.r6g.large"
    engine_version              = "6.2"
    num_cache_nodes             = 2
    replication_group_id        = "aws-wukongboss-dev-redis-01"
    automatic_failover_enabled  = true
    multi_az_enabled            = true
    replicas_per_node_group     = 1
    snapshot_retention_limit    = 7
    transit_encryption_enabled  = true
    auto_minor_version_upgrade  = false
    auth_token                  = "iJnpYAF8Z3nRrP6AdYLg"
    # maintenance_window         = "sun:21:30-sun:22:30"
    # snapshot_window            = "01:00-02:00"
    security_group_ids          = ["sg-0d51aea290250c684","sg-0fd2e461d5082b5f3"]
    subnet_group_name           = "aws-wukongboss-dev-redis-subnetgroup01"
    create_subnet_group         = true
    subnet_ids                  = ["subnet-011e8b0de384c9634", "subnet-0f2607f27d8c27196"]
    subnet_group_description    = " "
    create_parameter_group      = true
    parameter_group_name        = "aws-wukongboss-dev-redis-clusterparams-01"
    parameter_group_description = "aws-wukongboss-dev-redis-clusterparams-01"
    parameter_group_family      = "redis6.x"
    tags                        = {}
    parameters                  = [{
      name      = "cluster-enabled"
      value     = "yes"
    }]
  }
}