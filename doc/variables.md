# Module Variables

Variables for the configuration of the terraform module, defined in [variables](../variables.tf).

## Provider

| Parameter      | Description                                                                                                                                                        | Values | Default |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|---------|
| `tenancy_ocid` | Tenancy OCID where to create the resources. Required when configuring provider.                                                                                    | OCID   |         |
| `region`       | Region where to provision the VCN. [List of regions](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm). Required when configuring provider. |        |         |

## General OCI

| Parameter             | Description                                                                                      | Values | Default |
|-----------------------|--------------------------------------------------------------------------------------------------|--------|---------|
| `compartment_id`      | OCID of the compartment where to create all resources.                                           | OCID   |         |
| `label_prefix`        | A string that will be prepended to all resources.                                                |        | none    |
| `resource_name`       | A string to name all resource. If undefined it will be derived from compartment name.            |        | n/a     |
| `tags`                | A simple key-value pairs to tag the resources created.                                           |        |         |
| `ssh_public_key_path` | Path to the ssh public key used to access the host. set this or the `ssh_public_key`             |        | n/a     |
| `ssh_public_key`      | The content of the ssh public key used to access the host. set this or the `ssh_public_key_path` |        | n/a     |
| `ad_index`       | The index of the availability domain. This is used to identify the availability_domain place the compute instances. |        | 1       |


## VCN Variables

| Parameter                  | Description                                                                                              | Values     | Default     |
|----------------------------|----------------------------------------------------------------------------------------------------------|------------|-------------|
| `internet_gateway_enabled` | Whether to create the internet gateway.                                                                  | true/false | true        |
| `nat_gateway_enabled`      | Whether to create the nat gateway in the vcn.                                                            | true/false | true        |
| `service_gateway_enabled`  | Whether to create a service gateway in the vcn.                                                          | true/false | false       |
| `vcn_cidr`                 | cidr block of VCN.                                                                                       |            | 10.0.0.0/16 |
| `public_netnum`            | 0-based index of the public subnet when the VCN's CIDR is masked with the corresponding *newbit* value.  |            | 0           |
| `public_newbits`           | The difference between the VCN's netmask and the desired public subnet mask.                             |            | 8           |
| `private_netnum`           | 0-based index of the private subnet when the VCN's CIDR is masked with the corresponding *newbit* value. |            | 1           |
| `private_newbits`          | The difference between the VCN's netmask and the desired private subnet mask.                            |            | 8           |

## Bastion Host

| Parameter                  | Description                                                                                         | Values            | Default                              |
|----------------------------|-----------------------------------------------------------------------------------------------------|-------------------|--------------------------------------|
| `admin_email`              | Admin email used to configure Let's encrypt.                                                        |                   | admin@domain.com                     |
| `bastion_boot_volume_size` | Size of the boot volume.                                                                            |                   | 50                                   |
| `bastion_bootstrap`        | Bootstrap script to provision the bastion host.                                                     |                   | n/a                                  |
| `bastion_dns_registration` | Whether to register the bastion host in DNS zone.                                                   | true/false        | true                                 |
| `bastion_enabled`          | Whether to create the bastion host or not.                                                          | true/false        | false                                |
| `bastion_image_id`         | Provide a custom image id for the bastion host or leave as OEL (Oracle Enterprise Linux).           | OCID              | OEL                                  |
| `bastion_name`             | A Name portion of bastion host.                                                                     |                   | bastion                              |
| `bastion_os_version`       | Base OS version for the bastion host. This is used to identify the default `bastion_image_id`       |                   | 7.8                                  |
| `bastion_os`               | Base OS for the bastion host. This is used to identify the default `bastion_image_id`               |                   | Oracle Linux                         |
| `bastion_shape`            | The shape of bastion instance.                                                                      |                   | VM.Standard.E2.1                     |
| `bastion_state`            | Whether bastion host should be either RUNNING or STOPPED state.                                     | RUNNING / STOPPED | RUNNING                              |
| `bastion_subnet`           | List of subnets for the bastion hosts                                                               |                   | n/a                                  |
| `fail2ban_config`          | Path to a custom fail2ban configuration file                                                        |                   | `fail2ban.template.conf`             |
| `guacadmin_password`       | Guacamole console admin user password. If password is empty it will be auto generate during setup.  |                   | n/a                                  |
| `guacadmin_user`           | Guacamole console admin user                                                                        |                   | guacadmin                            |
| `guacamole_connections`    | Path to a custom guacamole connections SQL script                                                   |                   | `guacamole_connections.template.sql` |
| `guacamole_enabled`        | Whether to configure guacamole or not"                                                              | true/false        | true                                 |
| `guacamole_user"`          | Guacamole OS user name                                                                              |                   | avocado                              |
| `hosts_file`               | Content of a custom host file which has to be appended to `/etc/hosts`                                  |                   | `hosts.template`                     |
| `ssh_public_key_path`      | Path to the ssh public key used to access the bastion. set this or the `ssh_public_key`             |                   | n/a                                  |
| `ssh_public_key`           | The content of the ssh public key used to access the bastion. set this or the `ssh_public_key_path` |                   | n/a                                  |
| `staging`                  | Set to 1 if you're testing your setup to avoid hitting request limits                               | 0/1               | 0                                    |
| `yum_upgrade`              | Enable YUM upgrade during bootstrap / cloud-init                                                    | true/false        | true                                 |

## DB Host

| Parameter                        | Description                                                                                             | Values                | Default         |
|----------------------------------|---------------------------------------------------------------------------------------------------------|-----------------------|-----------------|
| `db_host_bootstrap`              | Bootstrap script to provision the host.                                                                 |                       | n/a             |
| `db_host_enabled`                | Whether to create the host or not.                                                                      | true/false            | false           |
| `db_host_image_id`               | Provide a custom image id for the host or leave as OEL (Oracle Enterprise Linux).                       | OCID                  | OEL             |
| `db_host_name`                   | A Name portion of host.                                                                                 |                       | db              |
| `db_host_public_ip`              | whether to assigne a public IP or not.                                                                  | true/false            | false           |
| `db_host_private_ip`             | Private IP for the host.                                                                                |                       | 10.0.1.6        |
| `db_host_os`                     | Base OS for the host. This is used to identify the default `db_host_image_id`                           |                       | Oracle Linux    |
| `db_host_os_version`             | Define the default OS version for Oracle Linux. This is used to identify the default `db_host_image_id` |                       | 7.8             |
| `db_host_shape`                  | The shape of compute instance.                                                                          |                       | VM.Standard2.2  |
| `db_host_boot_volume_size`       | Size of the boot volume.                                                                                |                       | 150             |
| `db_host_volume_enabled`         | Whether to create an additional volume or not.                                                          | true/false            | false           |
| `db_host_volume_attachment_type` | The type of volume                                                                                      | iscsi/paravirtualized | paravirtualized |
| `db_host_volume_size`            | Size of the volume.                                                                                     |                       | 256             |
| `db_host_state`                  | Whether host should be either RUNNING or STOPPED state.                                                 | RUNNING / STOPPED     | RUNNING         |

## Trivadis LAB

Specific parameter to configure the Trivadis LAB environment.

| Parameter          | Description                                                                                                                               | Values | Default          |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------|--------|------------------|
| `tvd_dns_hostnum`  | The host number for the Trivadis LAB DNS server. This number is used to build the IP address using cidrhost function.                     |        | 4                |
| `tvd_domain`       | The domain name of the LAB environment. This is used to register the public IP address of the bastion host.                               |        | trivadislabs.com |
| `tvd_participants` | The number of bastion resource to create. This is used to build several identical environments for a training and laboratory environment. |        | 1                |
| `tvd_private_dns`  | A private DNS IP address for the training environment. Default means that it will be created based on `tvd_dns_hostnum`                   |        | default          |
| `tvd_public_dns`   | A public DNS IP address for the training environment.                                                                                     |        | 8.8.8.8          |

## Local Variables

| Parameter             | Description                                                                                    | Values | Default   |
|-----------------------|------------------------------------------------------------------------------------------------|--------|-----------|
| `all_protocols`       | All protocols.                                                                                 |        | all       |
| `anywhere`            | CIDR block for anywhare.                                                                       |        | 0.0.0.0/0 |
| `availability_domain` | Effective name of the availability domain based on `var.region` and `var.ad_index`. |        |           |
| `bastion_image_id`    | Tenancy OCID where to create the resources. Required when configuring provider.                |        |           |
| `default_private_dns` | Default private DNS. IP address is derivated from `var.vcn_cidr` and `var.tvd_dns_hostnum`.    |        | 10.0.1.4  |
| `icmp_protocol`       | Number for the ICMP protocol.                                                                  |        | 1         |
| `private_dns_label`   | DNS label for the private subnet.                                                              |        | private   |
| `public_dns_label`    | DNS label for the public subnet.                                                               |        | public    |
| `rdp_port`            | Remote desktop port.                                                                           |        | 3389      |
| `resource_name`       | Local variable containing either the value of `var.resource_name` or the compartment name.     |        |           |
| `resource_shortname`  | Short, lower case version of the `resource_name` variable.                                     |        |           |
| `ssh_port`            | SSH port.                                                                                      |        | 22        |
| `tcp_protocol`        | Number for the TCP protocol.                                                                   |        | 6         |