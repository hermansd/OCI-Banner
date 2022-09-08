# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


resource "oci_core_instance" "appServer" {
  count               = var.number_hosts
  availability_domain = var.target_ad1
  #fault_domain        = var.fault_domain
  compartment_id      = var.target_compartment_ocid
  display_name        = "${var.service_label}esm01"
  shape               = var.shape_name

  shape_config {
    ocpus = var.host_ocpus
    memory_in_gbs = var.host_memmory
  }

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    display_name     = "${var.service_label}esm01"
    assign_public_ip = var.assign_public_ip
    hostname_label   = "${var.service_label}esm01"
  }

  source_details {
    source_type = "image"
    source_id   = var.os_image_ocid

  }

  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  #preserve_boot_volume = true

  metadata = {
    ssh_authorized_keys = var.sshkey
  }

  #defined_tags = var.defined_tags
  #timeouts {
  #  create = "60m"
  #}
}