create_resource_config = {
  MCD-AP-HK-PROD-DC-001 = {
    create_aws_dx_gateway = true
    name                              = "MCD-AP-HK-PROD-DC-001"
    amazon_side_asn                   = "64513"

    aws_dx_connection_config = {
      dxcon-ffhtqrzq = {
        name          = "0010088141-HKLL001008814100327120"
        location      = "EQHK1"
        create_aws_dx_connection = true
        bandwidth = "50Mbps"
        encryption_mode = "no_encrypt"
      }
    }

    aws_dx_transit_virtual_interface_config = {
      MCD-AP-HK-PROD-VIF-001 = {
        connection_id    = "dxcon-ffhtqrzq"
        name             = "MCD-AP-HK-PROD-VIF-001"
        vlan             = "235"
        address_family   = "ipv4"
        bgp_asn          = "9584"
        amazon_address   = "10.200.30.98/30"
        bgp_auth_key     = "peschowCedIbfiot"
        customer_address = "10.200.30.97/30"
        dx_gateway_id    = "51fe7f89-74be-4aa0-80bd-be1dbad6bd68"
        mtu              = "1500"
      }
    }

    aws_dx_gateway_association_config = {
      tgw-068fe4f6ebf61309d = {
        dx_gateway_id                       = "51fe7f89-74be-4aa0-80bd-be1dbad6bd68"
        allowed_prefixes                    = ["10.126.250.0/24", "10.126.251.0/24", "10.126.251.0/26", "10.126.251.128/26", "10.126.251.192/26", "10.126.251.64/26"]
        associated_gateway_id               = "tgw-068fe4f6ebf61309d"
      }
    }
  }
}