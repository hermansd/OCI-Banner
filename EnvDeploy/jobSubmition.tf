# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_core_instance" "jobSubServer" {
  count               = 0 # var.js_create_host ? 1:0
  availability_domain = var.target_ad1
  compartment_id      = var.target_compartment_ocid
  display_name        = "${var.service_label}js1"
  shape               = var.js_shape_name

  shape_config {
    ocpus = var.js_host_ocpus
    memory_in_gbs = var.js_host_memmory
  }

  create_vnic_details {
    subnet_id        = var.js_subnet_ocid
    display_name     = "${var.service_label}js1" 
    assign_public_ip = var.js_assign_public_ip
    hostname_label   = "${var.service_label}js1"
  }

  source_details {
    source_type = "image"
    source_id   = var.js_os_image_ocid

  }

  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  #preserve_boot_volume = true

  metadata = {
    ssh_authorized_keys = var.js_change_ssh ? var.js_sshkey : var.sshkey
  }

  #defined_tags = var.defined_tags
  #timeouts {
  #  create = "60m"
  #}
}
