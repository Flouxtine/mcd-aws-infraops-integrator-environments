create_msk_config = {
  "aws-wukongboss-uat-msk-01" : {
    kafka_version             = "3.6.0"
    broker_node_instance_type = "kafka.t3.small"
    number_of_broker_nodes    = 2
    name                      = "aws-wukongboss-uat-msk-01"
    broker_node_client_subnets = [
      "subnet-0a2d47f6b737591f1",
      "subnet-0e6ad4b4485340ab4",

    ]
    broker_node_security_groups = ["sg-010f9885ba13446c3"]


    client_authentication = {
      "sasl" : {
        "iam" : false,
        "scram" : true
      },
      "tls" : false
    }
    configuration_name     = "aws-wukongboss-uat-msk-params-01"
    configuration_revision = 1 # 注意,这个参数目的是为处理import时，第一次会修改问题，如果不设置会造成修改
    configuration_server_properties = {
      "auto.create.topics.enable": false,
      "default.replication.factor": 3,
      "min.insync.replicas": 2,
      "num.io.threads": 8,
      "num.network.threads": 5,
      "num.partitions": 1,
      "num.replica.fetchers": 2,
      "replica.lag.time.max.ms": 30000,
      "socket.receive.buffer.bytes": 102400,
      "socket.request.max.bytes": 104857600,
      "socket.send.buffer.bytes": 102400,
      "unclean.leader.election.enable": false
    }
    # kms_alias_name = "AmazonMSK_aws-wukongboss-sit-msk-01"

    kms_multi_region = true
    kms_policy = {
    "Id": "key-consolepolicy-3"
    "Statement": [
      {
        "Action": "kms:*"
        "Principal": {
          "AWS": "arn:aws:iam::863518445962:root"
        }
        "Resource": "*"
        "Sid"     : "Enable IAM User Permissions"
      },
      {
        "Action": [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:TagResource",
          "kms:UntagResource",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion",
          "kms:ReplicateKey",
          "kms:UpdatePrimaryRegion",
          "kms:RotateKeyOnDemand",
        ]
        "Effect": "Allow"
        "Principal": {
          "AWS":"arn:aws:iam::863518445962:user/Anchnet-changlh"
        }
        "Resource": "*"
        "Sid"     : "Allow access for Key Administrators"
      },
    ]
    "Version": "2012-10-17"
  }
  }

}
