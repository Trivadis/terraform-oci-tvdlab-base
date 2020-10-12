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
  source                    = "Trivadis/tvdlab-vcn/oci"
  version                   = "0.0.2"
  # provider parameters
  region                    = var.region
  # general oci parameters
  compartment_id            = var.compartment_id

  # vcn parameters
  nat_gateway_enabled       = true
  internet_gateway_enabled  = true
  vcn_dns_label             = var.vcn_dns_label
  vcn_name                  = var.vcn_name
  vcn_cidr                  = var.vcn_cidr
  tvd_participants          = var.tvd_participants
}
# --- EOF -------------------------------------------------------------------