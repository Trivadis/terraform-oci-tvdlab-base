# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: outputs.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.12
# Revision...: 
# Purpose....: Outputs defined for the terraform module tvdlab vcn.
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------

# - Provide information on VCN module ---------------------------------------
output "vcn_id" {
  description = "id of VCNs which are created"
  value       = module.tvdlab-vcn.vcn_id
}

output "internet_gateway_id" {
  description = "OCID of internet gateway, if it is created"
  value = module.tvdlab-vcn.internet_gateway_id
}

output "igw_route_id" {
  description = "OCID of internet gateway route table, if it is created"
  value = module.tvdlab-vcn.igw_route_id
}

output "nat_gateway_id" {
  description = "OCID of nat gateway , if it is created"
  value = module.tvdlab-vcn.nat_gateway_id
}

output "nat_route_id" {
  description = "OCID of VCN NAT gateway route table, if it is created"
  value = module.tvdlab-vcn.nat_route_id
}

output "default_dhcp_options_id" {
  description = "OCID of default DHCP options. "
  value = module.tvdlab-vcn.default_dhcp_options_id
}

output "default_security_list_id" {
  description = "OCID of default security list. "
  value = module.tvdlab-vcn.default_security_list_id
}

output "public_subnet_id" {
  description = "OCIDs of public subnet in VCN. "
  value = module.tvdlab-vcn.public_subnet_id
}

output "private_subnet_id" {
  description = "OCIDs of private subnet in VCN. "
  value = module.tvdlab-vcn.private_subnet_id
}

# - Provide information on bastion module -----------------------------------
output "bastion_id" {
  description = "OCID of the bastion server instances."
  value = module.tvdlab-bastion.bastion_id
}

output "bastion_public_ip" {
  description = "The public IP address of the bastion server instances."
  value = module.tvdlab-bastion.bastion_public_ip
}

output "bastion_dns_records" {
  description = "The DNS records for the bastion server instances."
  value = module.tvdlab-bastion.bastion_dns_records
}

# display public IPs
output "host_id" {
  description = "OCID of the server instances."
  value = module.tvdlab-compute.host_id
}

output "host_public_ip" {
  description = "The public IP address of the server instances."
  value = module.tvdlab-compute.host_public_ip
}
# --- EOF -------------------------------------------------------------------
