# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Environment
variable "service_label" {
  validation {
    condition     = length(regexall("^[A-Za-z][A-Za-z0-9]{1,7}$", var.service_label)) > 0
    error_message = "Validation failed for service_label: value is required and must contain alphanumeric characters only, starting with a letter up to a maximum of 8 characters."
  }
}

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
variable "region" {
  validation {
    condition     = length(trim(var.region, "")) > 0
    error_message = "Validation failed for region: value is required."
  }
}
