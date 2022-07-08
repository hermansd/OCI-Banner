// Copyright (c) 2017, 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Mozilla Public License v2.0

variable "vcn_cidr_block" {
  description = "(Required) Cider Block for VCN"
}
variable "local_cidr_block" {
  description = "(Required) Cider Block for On-Premise network"
}
variable "compartment_ocid" {
  description = "(Required) Compartment networking resources witll be placed"
}


output "subnet_web" {
  description = "id of web server subnet"
  value       = oci_core_subnet.web_server_subnet.id
}

output "subnet_db" {
  description = "id of db server subnet"
  value       = oci_core_subnet.db_server_subnet.id
}

output "subnet_dmz" {
  description = "id of dmz_subnet"
  value       = oci_core_subnet.dmz_subnet.id
}