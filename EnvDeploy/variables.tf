# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Environment
variable "service_label" {}

variable "target_compartment_ocid" {}
variable "target_ad1" {}
variable "target_ad2" {
  default = 0 
}
variable "multiple_ads" {}
variable "target_fd1" {
  default = 0 
}
variable "target_fd2" {
  default = 0 
}
variable "random_fds" {
  default = true
}
variable "host_count" {}
variable "shape_name" {}
variable "host_ocpus" {
  default = 1
}
variable "host_memmory" {
  default = 16
}
variable "os_image_ocid" {}
variable "vcn_compartment_ocid" {}
variable "vcn_ocid" {}
variable "subnet_compartment_ocid" {}
variable "subnet_ocid" {}
variable "assign_public_ip" {}
variable "sshkey" {}


variable "tenancy_ocid" {}
variable "user_ocid" {
  default = ""
}
variable "fingerprint" {
  default = ""
}
variable "private_key_path" {
  default = ""
}
variable "private_key_password" {
  default = ""
}
variable "region" {}
