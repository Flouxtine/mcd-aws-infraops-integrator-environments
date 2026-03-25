create_rds_config = {
  "aws-wukongboss-sit-mysql-01" : {

    create_db_instance              = true
    create_cloudwatch_log_group     = false
    create_db_parameter_group       = true
    create_db_subnet_group          = true
    db_subnet_group_name            = "aws-wukongboss-sit-mysql-subnetgroup01"
    subnet_group_description        = "aws-wukongboss-sit-mysql-subnetgroup01"
    engine                          = "mysql"
    subnet_ids                      = ["subnet-011e8b0de384c9634", "subnet-0f2607f27d8c27196"]
    instance_class                  = "db.m6g.2xlarge"
    storage_encrypted               = true
    enabled_cloudwatch_logs_exports = ["error", "slowquery"]
    parameter_group_description     = "aws-wukongboss-sit-mysql-params-01"
    parameter_group_name            = "aws-wukongboss-sit-mysql-params-01"
    family                          = "mysql8.0"
    auto_minor_version_upgrade      = false
    copy_tags_to_snapshot           = true
    monitoring_interval             = 60
    performance_insights_enabled    = true
    skip_final_snapshot             = true
    tags                            = {}
  }
}