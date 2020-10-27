# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: compartment.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.14
# Revision...: 
# Purpose....: Create a compartment for the training.
# Notes......: This will create a new compartment if it does not yet exists.
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------

# define the terraform provider
resource "oci_identity_compartment" "lab_compartment" {
    name           = var.resource_name
    description    = "Training compartment ${var.resource_name} created by terraform"
    compartment_id = var.base_compartment_ocid
    # true will cause this compartment to be deleted when running `terrafrom destroy`
    enable_delete  = var.compartment_delete_enabled                            
}
# --- EOF -------------------------------------------------------------------