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
# Modified...:
# see git revision history for more information on changes/updates
# ---------------------------------------------------------------------------

# get lab compartment resource information
# output "vcn_id" {
#   description = "id of VCNs which are created"
#   value       = module.tvdlab-vcn.vcn_id
# }

# output "internet_gateway_id" {
#   description = "OCID of internet gateway, if it is created"
#   value = module.tvdlab-vcn.vcn_id.internet_gateway_id
# }

# output "igw_route_id" {
#   description = "OCID of internet gateway route table, if it is created"
#   value       = module.tvdlab-vcn.vcn_id.igw_route_id
# }

# output "nat_gateway_id" {
#   description = "OCID of nat gateway , if it is created"
#   value       = module.tvdlab-vcn.vcn_id.nat_gateway_id
# }

# output "nat_route_id" {
#   description = "OCID of VCN NAT gateway route table, if it is created"
#   value       = module.tvdlab-vcn.vcn_id.nat_route_id
# }

# output "default_dhcp_options_id" {
#   description = "OCID of default DHCP options. "
#   value       = module.tvdlab-vcn.vcn_id.default_dhcp_options_id
# }

# output "public_subnet_id" {
#   description = "OCIDs of public subnet in VCN. "
#   value       = module.tvdlab-vcn.vcn_id.public_subnet_id
# }

# output "private_subnet_id" {
#   description = "OCIDs of private subnet in VCN. "
#   value       = module.tvdlab-vcn.vcn_id.private_subnet_id
# }

# display public IPs jumphost
output "bastion_public_ip" {
  description = "The public IP address of the bastion server instances."
  value = module.tvdlab-bastion.bastion_public_ip
}

# output "bastion_dns_records" {
#   description = "The DNS records for the bastion server instances."
#   value = module.tvdlab-bastion.bastion_dns_records
# }

# --- EOF -------------------------------------------------------------------