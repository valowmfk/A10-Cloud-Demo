#
# Variables for TKC Demo
#
variable "thunder_username" {
  description = "Username to use for API access to Thunder node"
  type        = string
  default     = "admin"
}

variable "thunder_password" {
  description = "Password for Username for API access to Thunder node"
  type        = string
  default     = "a10"
}

variable "thunder_ip_address_1" {
  description = "IP address of MGMT port on Thunder node"
  type        = string
  default     = "52.32.228.100"
}
variable "thunder_ip_address_2" {
  description = "IP address of MGMT port on Thunder node"
  type        = string
  default     = "52.13.52.80"
}
variable "thunder_instance_id" {
  description = "Instance ID of vThunder in AWS"
  type        = string
  default     = "i-02b5285c2a4f56b87"
}
variable "thunder_vip" {
  description = "IP address of VIP on Thunder node"
  type = string
  default = "10.0.11.101"
}
