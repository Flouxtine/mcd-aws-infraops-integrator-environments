create_rds_config = {
  aws-sit-deltaglobalcoreserv-mysql-01 = {
    create_db_instance           = true
    create_cloudwatch_log_group  = false
    create_db_parameter_group    = true
    create_db_subnet_group       = true
    username                     = "root"
    password                     = "ZKBNWqBV7cUi0BD93rkF"
    identifier                   = "aws-sit-deltaglobalcoreserv-mysql-01"
    db_subnet_group_name         = "aws-sit-deltaglobalcoreserv-mysql-subnetgroup01"
    subnet_group_description     = "aws-sit-deltaglobalcoreserv-mysql-subnetgroup01"
    parameter_group_name         = "aws-sit-deltaglobalcoreserv-mysql-params-01"
    engine                       = "mysql"
    subnet_ids = ["subnet-06765c7a7291adbc7","subnet-03a0dea2a528c3bb6"]
    multi_az   = false
    instance_class               = "db.m6g.xlarge"
    storage_encrypted            = true
    allocated_storage            = 50
    enabled_cloudwatch_logs_exports = ["error", "slowquery"]
    parameter_group_description  = "aws-sit-deltaglobalcoreserv-mysql-01"
    family                       = "mysql8.0"
    auto_minor_version_upgrade   = false
    copy_tags_to_snapshot        = true
    monitoring_interval          = 60
    performance_insights_enabled = true
    skip_final_snapshot          = true
    monitoring_role_arn          = "arn:aws:iam::863518445962:role/rds-monitoring-role"
    tags = {
      project       = "deltaglobal-coreserv"
      env           = "sit"
      Mcd-Project   = "deltaglobal-coreserv"
      project_owner = ""
      created       = "terraform"
    }
  }
}