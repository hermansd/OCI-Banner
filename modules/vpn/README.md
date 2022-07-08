Network Module
===================

This module creates all networking resources for Banner deployment

Example Usage
-------------

```hcl
module "network" {
  source             = "modules/networks"
  vcn_cidr_block     = var.vcn_cider_block
  compartment_ocid    = var.network_compartment_ocid
}

```

Inputs
------

| Name               | Description                                                      | Type   | Default                              | Required |
|--------------------|------------------------------------------------------------------|:------:|:------------------------------------:|:--------:|
| compartment_ocid   | (Required) SSH private key. E.g. `${file("~/.ssh/id_rsa")}`      | string |                  \-                  |   yes    |
| vcn_cidr_block     | (Required) Cider Block for VCN                                   | string |                  \-                  |   yes    |


Outputs
-------

| Name                | Description                    |
|---------------------|--------------------------------|
| vcn_id              | OCID of VCN created            |
