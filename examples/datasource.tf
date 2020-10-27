# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: datasource.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.14
# Revision...: 
# Purpose....: Define datasource used in this configuration.
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------

# define the Oracle linux image
data "oci_core_images" "oracle_images" {
  compartment_id           = var.base_compartment_ocid
  operating_system         = var.host_os
  operating_system_version = var.host_os_version
  shape                    = var.host_shape
  sort_by                  = "TIMECREATED"
}

# --- EOF -------------------------------------------------------------------
