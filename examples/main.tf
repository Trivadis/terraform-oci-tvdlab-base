# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: main.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.12
# Revision...: 
# Purpose....: Main file to use terraform module tvdlab vcn.
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------

# - ADD Base Module ---------------------------------------------------------
module "tvdlab-base" {
  source = "Trivadis/tvdlab-base/oci"
  #source = "../terraform-oci-tvdlab-base"
  version = "1.0.0"

  # - Mandatory Parameters --------------------------------------------------
  region              = var.region
  compartment_id      = var.compartment_id
  tenancy_ocid        = var.tenancy_ocid
  ssh_public_key      = var.ssh_public_key
  ssh_public_key_path = var.ssh_public_key_path

  # - Optional Parameters ---------------------------------------------------
  # Lab Configuration
  resource_name    = var.resource_name
  tvd_domain       = var.tvd_domain
  tvd_participants = var.tvd_participants

  # general oci parameters
  availability_domain = var.availability_domain
  label_prefix        = var.label_prefix
  tags                = var.tags

  # Trivadis LAB specific parameter 
  tvd_dns_hostnum = var.tvd_dns_hostnum
  tvd_private_dns = var.tvd_private_dns
  tvd_public_dns  = var.tvd_public_dns

  # VCN Network parameter
  nat_gateway_enabled      = var.nat_gateway_enabled
  internet_gateway_enabled = var.internet_gateway_enabled
  service_gateway_enabled  = var.service_gateway_enabled
  vcn_cidr                 = var.vcn_cidr
  private_netnum           = var.private_netnum
  private_newbits          = var.private_newbits
  public_netnum            = var.public_netnum
  public_newbits           = var.public_newbits

  # bastion parameters
  bastion_enabled          = var.bastion_enabled
  bastion_dns_registration = var.bastion_dns_registration
  bastion_name             = var.bastion_name
  bastion_image_id         = var.bastion_image_id
  bastion_shape            = var.bastion_shape
  bastion_bootstrap        = var.bastion_bootstrap
  bastion_state            = var.bastion_state

  # db host parameters
  host_enabled          = var.db_host_enabled
  host_name             = var.db_host_name
  host_image_id         = var.db_host_image_id
  host_shape            = var.db_host_shape
  host_bootstrap        = var.db_host_bootstrap
  host_state            = var.db_host_state
  host_public_ip        = var.db_host_public_ip
  host_private_ip       = var.db_host_private_ip
  host_os_version       = var.db_host_os_version
  host_boot_volume_size = var.db_host_boot_volume_size
}

# display public IPs of bastion hosts
output "bastion_public_ip" {
  description = "The public IP address of the bastion server instances."
  value = module.tvdlab-base.bastion_public_ip
}
# --- EOF -------------------------------------------------------------------
