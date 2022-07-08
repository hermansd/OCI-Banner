// Copyright (c) 2017, 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Mozilla Public License v2.0

variable "avalability_domain" {
  description = "(Required) The Avalability domain you want the server deployed to."
}

variable "compartment_ocid" {
  description = "(Required) The comapartment you want the server deployed to."
}

variable "display_name" {
  description = "(Required) The name of the server that will be deployed."
}

variable "fault_domain" {
  description = "The fault domains you want the server deployed to."
  default     = "FAULT-DOMAIN-1"
}

variable "num_instances" {
  description = "Number of instances to be created."
  default     = "0"
}

variable "num_volumes" {
  description = "Number of mounted volumes to add to instance"
  default     = "0"
}

variable "attached_volume_size" {
  description = "Size of teh block volume that will be attachated to instance."
  default = "50" # size in GBs
}

variable "shape" {
  description = "(Required) shape of instance to be created"
}

variable "ocpus" {
  description = "(Required) Number of OCPUS teh instance will have"
}

variable "image_ocid" {
  description = "(Required) OCID of OS image to be installed on the instance"
}

variable "subnet_ocid" {
  description = "(Required) OCID of teh subnet the server will be deployed to."
}

variable "assign_public_ip" {
  description = "(Required) You you want a public ip address assinged"
  type        = bool
}

variable "ssh_public_key" {
  description = "(Required) SSH Public key to assign to OPC users"
}

variable "defined_tags" {
  description = "defined tags to add to instance"
}

variable "tenancy_ocid" {
  description = "OCID of teh tenancy to create instance in."
}