# Example

Example to use *terraform-oci-tvdlab-base* to setup a VCN with Bastion and DB Host.

The example contains the following resources:

- [compartment.tf](compartment.tf) Terraform configuration file for the training compartment.
- [datasource.tf](datasource.tf) Define datasources used in this configuration.
- [locals.tf](locals.tf) Local variables this terraform configuration.
- [main.tf](main.tf) Main configuration to build the training environment.
- [outputs.tf](outputs.tf) Outputs defined for the terraform configuration.
- [provider.tf](provider.tf) Provider specific configuration for this terraform configuration.
- [terraform.tfvars.example](terraform.tfvars.example) Configuration respectively variable file for this terraform configuration. Modify this file or alternatively the `TF_VAR_xxx` variables to customize the oci infrastructure.
- [variables.tf](variables.tf): Variable definition for this terraform configuration.
configuration, including variables, resources, data sources and outputs.

__Note: This is an example to demonstrate reusing this Terraform module to create additional network resources. Ensure you evaluate your own security needs when creating security lists, network security groups etc.__
