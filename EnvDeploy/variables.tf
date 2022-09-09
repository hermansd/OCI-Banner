# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Environment
variable "service_label" {}
variable "target_compartment_ocid" {}
variable "target_ad1" {}
variable "sshkey" {}


#Application Servers
variable "app_target_ad2" {
  default = 0 
}
variable "app_multiple_ads" {
  default = false
}
variable "app_target_fd1" {
  default = 0 
}
variable "app_target_fd2" {
  default = 0 
}
variable "app_multiple_fds" {
  default = false
}
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
variable "app_change_ssh" {
  default = false  
}
variable "app_sshkey" {
  default = ""
}

#Load Balancers
variable "lb_create_lb" { default = false }

#Job Submition Server
variable "js_create_host" {
  default = false
  }
variable "js_shape_name"     {
  default = ""
}
variable "js_host_ocpus" {
  default = 1
}
variable "js_host_memmory" {
  default = 16
}
variable "js_os_image_ocid" {
  default = ""
}
variable "js_vcn_compartment_ocid" {
  default = ""
}
variable "js_vcn_ocid" {
  default = ""
}
variable "js_subnet_compartment_ocid" {
  default = ""
}
variable "js_subnet_ocid" {
  default = ""
}
variable "js_assign_public_ip" {
  default = ""
}
variable "js_change_ssh" {
  default = ""
}
variable "js_sshkey" {
  default = ""
}

#Database Server
variable "db_create_database" {
  default = false
}

#General 
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
variable "fault_domain" {
  default = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
}