# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: main.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.12
# Revision...: 
# Purpose....: Main file for the terraform module tvdlab vcn.
# Notes......: Define a minimal terraform version
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------

terraform {
  required_version = ">= 0.13.0"
}

# - ADD VCM Module ----------------------------------------------------------
module "tvdlab-vcn" {
  source = "Trivadis/tvdlab-vcn/oci"
  #source = "../terraform-oci-tvdlab-vcn"
  version = "1.1.0"

  # - Mandatory Parameters --------------------------------------------------
  region         = var.region
  compartment_id = var.compartment_id

  # - Optional Parameters ---------------------------------------------------
  # Lab Configuration
  resource_name    = var.resource_name
  tvd_domain       = var.tvd_domain
  tvd_participants = var.tvd_participants

  # general oci parameters
  label_prefix = var.label_prefix
  tags         = var.tags

  # VCN Network parameter
  nat_gateway_enabled      = var.nat_gateway_enabled
  internet_gateway_enabled = var.internet_gateway_enabled
  service_gateway_enabled  = var.service_gateway_enabled
  vcn_cidr                 = var.vcn_cidr
  private_netnum           = var.private_netnum
  private_newbits          = var.private_newbits
  public_netnum            = var.public_netnum
  public_newbits           = var.public_newbits

  # Trivadis LAB specific parameter 
  tvd_dns_hostnum = var.tvd_dns_hostnum
  tvd_private_dns = var.tvd_private_dns
  tvd_public_dns  = var.tvd_public_dns
}

# - ADD Bastion Host Module -------------------------------------------------
module "tvdlab-bastion" {
  source = "Trivadis/tvdlab-bastion/oci"
  #source = "../terraform-oci-tvdlab-bastion"
  version = "1.0.1"

  # - Mandatory Parameters --------------------------------------------------
  tenancy_ocid        = var.tenancy_ocid
  region              = var.region
  compartment_id      = var.compartment_id
  ssh_public_key      = var.ssh_public_key
  ssh_public_key_path = var.ssh_public_key_path
  bastion_subnet      = module.tvdlab-vcn.public_subnet_id

  # - Optional Parameters ---------------------------------------------------
  # general oci parameters
  ad_index            = var.ad_index
  label_prefix        = var.label_prefix
  tags                = var.tags

  # Lab Configuration
  resource_name    = var.resource_name
  tvd_domain       = var.tvd_domain
  tvd_participants = var.tvd_participants

  # bastion parameters
  bastion_enabled          = var.bastion_enabled
  bastion_dns_registration = var.bastion_dns_registration
  bastion_name             = var.bastion_name
  bastion_image_id         = var.bastion_image_id
  bastion_shape            = var.bastion_shape
  bastion_bootstrap        = var.bastion_bootstrap
  bastion_state            = var.bastion_state
}

# - ADD DB Module -----------------------------------------------------------
module "tvdlab-db" {
  source  = "Trivadis/tvdlab-compute/oci"
  version = "0.0.3"

  # - Mandatory Parameters --------------------------------------------------
  tenancy_ocid   = var.tenancy_ocid
  region         = var.region
  compartment_id = var.compartment_id
  # either ssh_public_key or ssh_public_key_path must be specified
  ssh_public_key      = var.ssh_public_key
  ssh_public_key_path = var.ssh_public_key_path
  host_subnet         = module.tvdlab-vcn.private_subnet_id

  # - Optional Parameters ---------------------------------------------------
  # general oci parameters
  ad_index            = var.ad_index
  label_prefix        = var.label_prefix
  tags                = var.tags

  # Lab Configuration
  resource_name    = var.resource_name
  tvd_domain       = var.tvd_domain
  tvd_participants = var.tvd_participants

  # host parameters
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

# --- EOF -------------------------------------------------------------------
