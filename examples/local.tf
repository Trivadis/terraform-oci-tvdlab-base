# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: locals.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.14
# Revision...: 
# Purpose....: Local variables this terraform configuration.
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------
locals {
  compartment_id     = var.compartment_id == "" ? oci_identity_compartment.lab_compartment.id : var.compartment_id
  resource_name      = var.resource_name == "" ? oci_identity_compartment.lab_compartment.name : var.resource_name
  resource_shortname = lower(replace(local.resource_name, "-", ""))
}
# --- EOF -------------------------------------------------------------------



