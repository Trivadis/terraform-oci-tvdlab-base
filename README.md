# Terraform Trivadis LAB Base for OCI

## Introduction

A reusable and extensible Terraform module that provisions a Trivadis LAB on Oracle Cloud Infrastructure.

It creates the following resources:

* A VCN using [Trivadis/terraform-oci-tvdlab-vcn](https://github.com/Trivadis/terraform-oci-tvdlab-vcn)
* An optional internet gateway
* An optional NAT gateway
* An optional service gateway
* An optional bastion host using [Trivadis/terraform-oci-tvdlab-bastion](https://github.com/Trivadis/terraform-oci-tvdlab-bastion)
* Optional n-number of base envrionments. This is used to build several identical environments for a training and laboratory environment.

The module can be parametrized by the number of participants. This will then create n times the environment. The following figure shows a VCN with Basion host for the compartment O-SEC. i.e. `resource_name` has been derivated from compartment name.

![Base architecture overview](https://github.com/Trivadis/terraform-oci-tvdlab-base/raw/main/doc/images/architecture.png)

## Prerequisites

- An OCI account
- Install [Terraform](https://www.terraform.io/downloads.html)
- Create a Terraform Configuration

**HINT** This terraform module does use `count` to create multiple identical resources. Due to this at least Terraform version 0.13.0+ is required.

## Quickstart

The module is available in [Terraform registry](https://registry.terraform.io/modules/Trivadis/tvdlab-base/oci/latest). You may either us it via registry or clone [terraform-oci-tvdlab-vcn](https://github.com/Trivadis/terraform-oci-tvdlab-base) from github.

Add the module to the `main.tf` with the mandatory parameter. 

```bash
module "tvdlab-base" {
  source = "Trivadis/tvdlab-base/oci"
  #source = "../terraform-oci-tvdlab-base"
  version = "1.0.0"

  # - Mandatory Parameters --------------------------------------------------
  region                = var.region
  compartment_id        = var.compartment_id
  tenancy_ocid          = var.tenancy_ocid
  ssh_public_key        = var.ssh_public_key
}
```

To create multiple environments just specify the `tvd_participants` parameter. The following example will create 3 VCN including corresponding bastion hosts.

```bash
module "tvdlab-base" {
  source = "Trivadis/tvdlab-base/oci"
  #source = "../terraform-oci-tvdlab-base"
  version = "1.0.0"

  # - Mandatory Parameters --------------------------------------------------
  region                = var.region
  compartment_id        = var.compartment_id
  tenancy_ocid          = var.tenancy_ocid
  ssh_public_key        = var.ssh_public_key
  tvd_participants      = 3
}
```

The module can be customized by a couple of additional parameter. See [variables](./doc/variables.md) for more information about customisation. The folder [examples](examples) does contain an example files for [main.tf](examples/main.tf), [variables.tv](examples/variables.tf) and [terraform.tfvars](examples/terraform.tfvars.example).

## Related Documentation, Blog

- [Oracle Cloud Infrastructure Documentation](https://docs.cloud.oracle.com/iaas/Content/home.htm)
- [Terraform OCI Provider Documentation](https://www.terraform.io/docs/providers/oci/index.html)
- [Terraform Creating Modules](https://www.terraform.io/docs/modules/index.html)

## Projects using this module

Currently none known.

## Releases and Changelog

You find all releases and release information [here](https://github.com/Trivadis/terraform-oci-tvdlab-base/releases).

## Issues
Please file your bug reports, enhancement requests, questions and other support requests within [Github's issue tracker](https://help.github.com/articles/about-issues/).

* [Questions](https://github.com/Trivadis/terraform-oci-tvdlab-base/issues?q=is%3Aissue+label%3Aquestion)
* [Open enhancements](https://github.com/Trivadis/terraform-oci-tvdlab-base/issues?q=is%3Aopen+is%3Aissue+label%3Aenhancement)
* [Open bugs](https://github.com/Trivadis/terraform-oci-tvdlab-base/issues?q=is%3Aopen+is%3Aissue+label%3Abug)
* [Submit new issue](https://github.com/Trivadis/terraform-oci-tvdlab-base/issues/new)

## How to Contribute

1. Describe your idea by [submitting an issue](https://github.com/Trivadis/terraform-oci-tvdlab-base/issues/new)
2. [Fork this respository](https://github.com/Trivadis/terraform-oci-tvdlab-base/fork)
3. [Create a branch](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/), commit and publish your changes and enhancements
4. [Create a pull request](https://help.github.com/articles/creating-a-pull-request/)

## Acknowledgement

Code derived and adapted from [oracle-terraform-modules/terraform-oci-vcn](https://github.com/oracle-terraform-modules/terraform-oci-vcn) and Hashicorp's [Terraform 0.12 examples](https://github.com/terraform-providers/terraform-provider-oci/tree/master/examples).

## License

Copyright (c) 2019, 2020 Trivadis AG and/or its associates. All rights reserved.

The Trivadis Terraform modules are licensed under the Apache License, Version 2.0. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
