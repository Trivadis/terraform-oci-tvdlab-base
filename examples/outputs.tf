# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: main.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.14
# Revision...: 
# Purpose....: Outputs defined for the terraform configuration.
# Notes......: --
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------
output "compartment_ocid" {
  value       = oci_identity_compartment.lab_compartment.id
  description = "The OCID of the training compartment"
}

# display the VCN IDs
output "vcn_id" {
  description = "id of VCNs which are created"
  value       = module.tvdlab-base.vcn_id
}

# display public IPs of bastion hosts
output "bastion_public_ip" {
  description = "The public IP address of the bastion server instances."
  value = module.tvdlab-base.bastion_public_ip
}

output "bastion_hostname" {
  description = "The hostname for VNIC's primary private IP of the bastion server instances."
  value = module.tvdlab-base.bastion_hostname
}

output "bastion_private_ip" {
  description = "The private IP address of the bastion server instances."
  value = module.tvdlab-base.bastion_private_ip
}

output "bastion_dns_records" {
  description = "The DNS records for the bastion server instances."
  value = module.tvdlab-base.bastion_dns_records
}

# --- EOF -------------------------------------------------------------------