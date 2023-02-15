#
#  vThunder configs for A10 Cloud Demo
#  Matt Klouda, John Allen, Anders DuPuis-Lund, Jim McGhee
#
#

terraform {
  required_providers {
    thunder = {
      source  = "a10networks/thunder"
      version = "1.0.0"
    }
  }
}

provider "thunder" {
  #  source = "a10networks/vthunder"
  address  = var.thunder_ip_address_2
  username = var.thunder_username
  password = var.thunder_password
  # password = var.thunder_instance_id
}
resource "thunder_ip_dns_primary" "dns1" {
  ip_v4_addr = "8.8.8.8"
}
#
# Add GLM config and token - Update with your GLM token for vThunder
#
resource "thunder_glm" "glm1" {
  use_mgmt_port   = 1
  enable_requests = 1
  token           = "A10fd9baea77"
}
#
# Send GLM 
#
resource "thunder_glm_send" "glm1" {
  license_request = 1
}
#
# Configure ethernet interfaces and name/description
#
resource "thunder_interface_ethernet" "eth1" {
  ifnum  = 1
  name   = "Eth1_Servers_Public_Inside"
  action = "enable"
  ip {
    address_list {
      ipv4_address = "10.0.11.11"
      ipv4_netmask = "/24"
    }
  }
}
resource "thunder_interface_ethernet" "eth2" {
  ifnum  = 2
  name   = "Eth2_Servers_VIP_Private_Outside"
  action = "enable"
  ip {
    address_list {
      ipv4_address = "10.0.101.11"
      ipv4_netmask = "/24"
    }
  }
}
resource "thunder_virtual_server" "ws-vip" {
  name = "ws-vip"
  ip_address = var.thunder_vip
  # template_virtual_server = "bw-control"
  port_list {
    port_number = 80
    protocol = "http"
    # aflex_scripts {
    #     aflex = "http-error-status-log"
    # }
  }
}
