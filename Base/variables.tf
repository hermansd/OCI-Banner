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

#Advanced options check boxes used in schema.yml
variable "env_advanced_options" {
  type = bool
  default = false
} 
variable "net_advanced_options" {
  type = bool
  default = false
} 
variable "exa_advanced_options" {
  type = bool
  default = false
} 
variable "connectivity_advanced_options" {
  type = bool
  default = false
}
variable "notifications_advanced_options" {
  type = bool
  default = false
}

#Enclosing Compartment
variable "use_enclosing_compartment" {
  type        = bool
  default     = false
  description = "Whether the Landing Zone compartments are created within an enclosing compartment. If false, the Landing Zone compartments are created under the root compartment."
}
variable "existing_enclosing_compartment_ocid" {
  type        = string
  default     = null
  description = "The enclosing compartment OCID where Landing Zone compartments will be created. If not provided and use_enclosing_compartment is true, an enclosing compartment is created under the root compartment."
}
variable "policies_in_root_compartment" {
  type        = string
  default     = "CREATE"
  description = "Whether required grants at the root compartment should be created or simply used. Valid values: 'CREATE' and 'USE'. If 'CREATE', make sure the user executing this stack has permissions to create grants in the root compartment. If 'USE', no grants are created."
  validation {
    condition     = contains(["CREATE", "USE"], var.policies_in_root_compartment)
    error_message = "Validation failed for policies_in_root_compartment: valid values are CREATE or USE."
  }
}
