# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: variables.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.12
# Revision...: 
# Purpose....: Variable file for the terraform module tvdlab base.
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------

# provider identity parameters ----------------------------------------------
variable "tenancy_ocid" {
  description = "tenancy id where to create the resources"
  type        = string
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The OCI region where resources will be created"
  type        = string
}

# general oci parameters ----------------------------------------------------
variable "compartment_id" {
  description = "OCID of the compartment where to create all resources"
  type        = string
}

variable "label_prefix" {
  description = "A string that will be prepended to all resources"
  type        = string
  default     = "none"
}

variable "resource_name" {
  description = "user-friendly string to name all resource. If undefined it will be derived from compartment name. "
  type        = string
  default     = ""
}

variable "availability_domain" {
  description = "the AD to place the bastion host"
  default     = 1
  type        = number
}

variable "tags" {
  description = "A simple key-value pairs to tag the resources created"
  type        = map(any)
  default     = {}
}

# VCN parameters ------------------------------------------------------------
variable "internet_gateway_enabled" {
    description = "whether to create the internet gateway"
    default     = true
    type        = bool
}

variable "nat_gateway_enabled" {
    description = "whether to create a nat gateway in the vcn"
    default     = true
    type        = bool
}

variable "service_gateway_enabled" {
    description = "whether to create a service gateway"
    default     = false
    type        = bool
}

variable "vcn_cidr" {
    description = "cidr block of VCN"
    default     = "10.0.0.0/16"
    type        = string
}

# Public Subnet parameters --------------------------------------------------
variable "public_netnum" {
  description = "0-based index of the bastion subnet when the VCN's CIDR is masked with the corresponding newbit value."
  default     = 0
  type        = number
}

variable "public_newbits" {
  description = "The difference between the VCN's netmask and the desired bastion subnet mask"
  default     = 8
  type        = number
}

# Private Subnet parameters -------------------------------------------------
variable "private_netnum" {
  description = "0-based index of the private subnet when the VCN's CIDR is masked with the corresponding newbit value."
  default     = 1
  type        = number
}

variable "private_newbits" {
  description = "The difference between the VCN's netmask and the desired private subnet mask"
  default     = 8
  type        = number
}

# Bastion Host Parameter ----------------------------------------------------
variable "bastion_enabled" {
  description = "whether to create the bastion"
  default     = true
  type        = bool
}

variable "bastion_dns_registration" {
  description = "whether to register the bastion host in DNS zone"
  default     = false
  type        = bool
}

variable "bastion_name" {
  description = "Name portion of bastion host"
  default     = "bastion"
  type        = string
}

variable "bastion_image_id" {
  description = "Provide a custom image id for the bastion host or leave as OEL (Oracle Enterprise Linux)."
  default     = "OEL"
  type        = string
}

variable "bastion_os_version" {
  description = "Define the default OS version for Oracle Linux."
  default     = "7.8"
  type        = string
}

variable "bastion_shape" {
  description = "The shape of bastion instance."
  default     = "VM.Standard.E2.1"
  type        = string
}

variable "bastion_boot_volume_size" {
  description = "Size of the boot volume."
  default     = 50
  type        = number
}

variable "bastion_state" {
  description = "Whether bastion host should be either RUNNING or STOPPED state. "
  default     = "RUNNING"
}

variable "bastion_bootstrap" {
  description = "Bootstrap script."
  default     = ""
  type        = string
}

variable "ssh_public_key" {
  description = "the content of the ssh public key used to access the bastion. set this or the ssh_public_key_path"
  default     = ""
  type        = string
}

variable "ssh_public_key_path" {
  description = "path to the ssh public key used to access the bastion. set this or the ssh_public_key"
  default     = ""
  type        = string
}

# DB Host Parameter ----------------------------------------------------
variable "db_host_enabled" {
  description = "whether to create the compute instance or not."
  default     = false
  type        = bool
}

variable "db_host_name" {
  description = "Name portion of host"
  default     = "db"
  type        = string
}

variable "db_host_public_ip" {
  description = "whether to assigne a public IP or not."
  default     = false
  type        = bool
}

variable "db_host_private_ip" {
  description = "Private IP for host."
  default     = "10.0.1.6"
  type        = string
}

variable "db_host_image_id" {
  description = "Provide a custom image id for the host or leave as OEL (Oracle Enterprise Linux)."
  default     = "OEL"
  type        = string
}

variable "db_host_os_version" {
  description = "Define the default OS version for Oracle Linux."
  default     = "7.8"
  type        = string
}

variable "db_host_shape" {
  description = "The shape of compute instance."
  default     = "VM.Standard.E2.2"
  type        = string
}

variable "db_host_boot_volume_size" {
  description = "Size of the boot volume."
  default     = 150
  type        = number
}

variable "db_host_state" {
  description = "Whether the host should be either RUNNING or STOPPED state. "
  default     = "RUNNING"
}

variable "db_host_bootstrap" {
  description = "Bootstrap script."
  default     = ""
  type        = string
}

# Trivadis LAB specific parameter -------------------------------------------
variable "tvd_participants" {
    description = "The number of VCNs to create"
    type        = number
    default     = 1
}

variable "tvd_domain" {   
    description = "The domain name of the LAB environment"
    type        = string
    default     = "trivadislabs.com" 
}

variable "tvd_dns_hostnum" {   
    description = "The host number for the Trivadis LAB DNS server. This number is used to build the IP address using cidrhost function"
    type        = number
    default     = 4
}

variable "tvd_private_dns" {   
    description = "A private DNS IP address for the training environment"
    type        = string
    default     = "default" 
}

variable "tvd_public_dns" {   
    description = "A public DNS IP address for the training environment"
    type        = string
    default     = "8.8.8.8" 
}
# --- EOF -------------------------------------------------------------------
