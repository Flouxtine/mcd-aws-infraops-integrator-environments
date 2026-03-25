create_opensearch_config = {
  aws-wukongboss-uat-os-01 = {
    domain_name = "aws-wukongboss-uat-os-01"
    log_publishing_options = {
      enabled                  = false
      log_type                 = "INDEX_SLOW_LOGS"
      cloudwatch_log_group_arn = "arn:aws:logs:ap-east-1:123456789012:log-group:/aws/opensearch/dev-search-domain"
    }
    cluster_config = {
      instance_type = "c6g.2xlarge.search"
    }
    encrypt_at_rest = {
      enabled = true
      kms_key_id = "arn:aws:kms:ap-east-1:863518445962:key/7a8993fb-b5c6-4c14-96be-c6179b652224"
    }
    vpc_options = {
      enabled = true
      subnet_ids = [
        "subnet-0a2d47f6b737591f1",
        "subnet-0e6ad4b4485340ab4"
      ]
      security_group_ids = [
        "sg-02edf6dff6b5ed0ec"
      ]
      availability_zones = [
        "ap-east-1a",
        "ap-east-1b"
      ]
    }

    off_peak_window_options = {
      enabled = true
      off_peak_window = {
        window_start_time = {
          hours = 0
          minutes = 0
        }
      }
    }

    snapshot_options = {
      automated_snapshot_start_hour = 0
    }
    software_update_options = {
      auto_software_update_enabled = false
    }

  }
}

