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
# Modified...:
# see git revision history for more information on changes/updates
# ---------------------------------------------------------------------------

module "tvdlab-vcn" {
  source  = "Trivadis/tvdlab-vcn/oci"
  version = "1.0.1"
  # provider parameters
  region = var.region

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = var.label_prefix

  # vcn parameters
  internet_gateway_enabled = var.internet_gateway_enabled
  nat_gateway_enabled      = var.nat_gateway_enabled
  service_gateway_enabled  = var.service_gateway_enabled
  vcn_name                 = var.vcn_name
  vcn_cidr                 = var.vcn_cidr
  tvd_participants         = var.tvd_participants
  tags                     = var.tags
}

module "tvdlab-bastion" {
  source  = "Trivadis/tvdlab-bastion/oci"
  #source  = "../terraform-oci-tvdlab-bastion"
  version = "0.1.1"
  # provider parameters
  region = var.region

  # general oci parameters
  compartment_id = var.compartment_id
  tenancy_ocid   = var.tenancy_ocid
  label_prefix   = var.label_prefix

  # vcn parameters
  bastion_enabled          = var.bastion_enabled
  bastion_dns_registration = var.bastion_dns_registration
  vcn_name                 = var.vcn_name
  ssh_public_key           = var.ssh_public_key
  tvd_participants         = var.tvd_participants
  bastion_subnet           = module.tvdlab-vcn.public_subnet_id
  tags                     = var.tags
}

# --- EOF -------------------------------------------------------------------
