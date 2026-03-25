create_rds_config = {
  aws-sit-raven-mysql-01 = {
    create_db_instance           = true
    create_cloudwatch_log_group  = false
    create_db_parameter_group    = true
    create_db_subnet_group       = true
    username                     = "root"
    password                     = "ZKBNWqBV7cUi0BD93rkF"
    identifier                   = "aws-sit-raven-mysql-01"
    db_subnet_group_name         = "aws-sit-raven-mysql-subnetgroup01"
    subnet_group_description     = "aws-sit-raven-mysql-subnetgroup01"
    parameter_group_name         = "aws-sit-raven-mysql-params-01"
    engine                       = "mysql"
    engine_version               = "8.4.7"
    subnet_ids = ["subnet-0b1b7ae63d9e70bc0","subnet-0d62632a1f615939e"]
    multi_az   = false
    instance_class               = "db.m6g.xlarge"
    storage_encrypted            = true
    allocated_storage            = 100
    enabled_cloudwatch_logs_exports = ["error", "slowquery"]
    parameter_group_description  = "aws-sit-raven-mysql-01"
    family                       = "mysql8.4"
    auto_minor_version_upgrade   = false
    copy_tags_to_snapshot        = true
    monitoring_interval          = 60
    performance_insights_enabled = true
    skip_final_snapshot          = true
    monitoring_role_arn          = "arn:aws:iam::863518445962:role/rds-monitoring-role"
    tags = {
      project       = "raven"
      env           = "sit"
      Mcd-Project   = "INFRA-SIT-Raven"
      project_owner = ""
      created       = "terraform"
    }
  }
}