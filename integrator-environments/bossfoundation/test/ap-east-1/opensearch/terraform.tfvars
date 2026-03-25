create_opensearch_config = {
  aws-bossfoundation-test-os-01 = {
    domain_name    = "aws-bossfoundation-test-os-1"
    engine_version = "OpenSearch_3.1"
    log_publishing_options = {
      enabled  = false
      log_type = "INDEX_SLOW_LOGS"
    }

    cluster_config = {
      instance_type                 = "c7g.large.search"
      instance_count                = 4
      availability_zone_count       = 2
      multi_az_with_standby_enabled = false
    }

    ebs_options = {
      ebs_enabled = true
      volume_size = 100
      throughput  = 125
      iops        = 3000
    }

    encrypt_at_rest = {
      enabled = true
    }
    vpc_options = {
      enabled = true
      subnet_ids = ["subnet-03a0dea2a528c3bb6", "subnet-06765c7a7291adbc7"]
      availability_zones = [
        "ap-east-1a",
        "ap-east-1c"
      ]
    }

    off_peak_window_options = {
      enabled = true
      off_peak_window = {
        window_start_time = {
          hours   = 0
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

    tags = {
      project = "bossfoundation"
      env     = "test"
      Mcd-Project = "bossfoundation"
      project_owner = ""
      created      = "terraform"
    }
  }
}

