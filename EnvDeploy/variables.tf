# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Environment
variable "service_label" {}

variable "target_compartment_ocid" {}
variable "target_ad1" {}
variable "app_target_ad2" {
  default = 0 
}
variable "app_multiple_ads" {}
variable "app_target_fd1" {}
variable "app_target_fd2" {
  default = 0 
}
variable "app_,ultiple_fds" {}
variable "app_host_count" {}
variable "app_shape_name" {}
variable "app_host_ocpus" {
  default = 1
}
variable "app_host_memmory" {
  default = 16
}
variable "app_os_image_ocid" {}
variable "app_vcn_compartment_ocid" {}
variable "app_vcn_ocid" {}
variable "app_subnet_compartment_ocid" {}
variable "app_subnet_ocid" {}
variable "app_assign_public_ip" {}
variable "app_sshkey" {}


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
