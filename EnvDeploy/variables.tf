# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Environment
variable "service_label" {}
variable "target_compartment_ocid" {}
variable "target_ad1" {}
variable "sshkey" {}


#Application Servers
variable "app_create_host" {}
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
variable "app_host_count" {
  default = 1
}
variable "app_shape_name" {
  default = "VM.Standard.E4.Flex"
}
variable "app_host_ocpus" {
  default = 1
}
variable "app_host_memmory" {
  default = 16
}
variable "app_os_image_ocid" {
  default = "OS TBD"
}
variable "app_vcn_compartment_ocid" {
  default = "ocid1.compartment.oc1..12314"
}
variable "app_vcn_ocid" {
  default = "ocid1.vcn.oc1.phx.a12344"
}
variable "app_subnet_compartment_ocid" {
  default = "ocid1.vcn.oc1.phx.a12344"
}
variable "app_subnet_ocid" {
  default = "ocid1.compartment.oc1..12314"
}
variable "app_assign_public_ip" {
  default = false
}
variable "app_change_ssh" {
  default = false  
}
variable "app_sshkey" {
  default = ""
}

#Load Balancers
variable "lb_create_lb" { 
  default = false 
}

#Job Submition Server
variable "js_create_host" {
  default = false
}
variable "js_shape_name"     {
  default = "VM.Standard.E4.Flex"
}
variable "js_host_ocpus" {
  default = 1
}
variable "js_host_memmory" {
  default = 16
}
variable "js_os_image_ocid" {
  default = "OS TBD"
}
variable "js_vcn_compartment_ocid" {
  default = "ocid1.compartment.oc1..12314"
}
variable "js_vcn_ocid" {
  default = "ocid1.vcn.oc1.phx.a12344"
}
variable "js_subnet_compartment_ocid" {
    default = "ocid1.compartment.oc1..12314"
}
variable "js_subnet_ocid" {
  default = "ocid1.subnet.oc1.000000"
}
variable "js_assign_public_ip" {
  default = false
}
variable "js_change_ssh" {
  default = false
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

locals {
fault_domain = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]

}

#variable 
#"fault_domain" {
#  type    = list(string)
#  default = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
#}