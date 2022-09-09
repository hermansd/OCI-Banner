# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

locals{ 
  compartment_ocid = var.target_compartment_ocid
  service_label =    var.service_label
  shape_name =       var.js_shape_name
  host_ocpus =       var.js_host_ocpus
  host_memmory =     var.js_host_memmory
  os_image_ocid =    var.js_os_image_ocid
  subnet_ocid =      var.js_subnet_ocid
  assign_public_ip = var.js_assign_public_ip
  sshkey =           var.js_change_ssh ? var.js_sshkey : var.sshkey
}


resource "oci_core_instance" "jobSubServer" {
  availability_domain = local.target_ad1
  compartment_id      = local.compartment_ocid
  display_name        = "${local.service_label}js${count.index}"
  shape               = local.shape_name

  shape_config {
    ocpus = local.host_ocpus
    memory_in_gbs = local.host_memmory
  }

  create_vnic_details {
    subnet_id        = local.subnet_ocid
    display_name     = "${local.service_label}js${count.index}"
    assign_public_ip = local.assign_public_ip
    hostname_label   = "${local.service_label}js${count.index}"
  }

  source_details {
    source_type = "image"
    source_id   = local.os_image_ocid

  }

  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  #preserve_boot_volume = true

  metadata = {
    ssh_authorized_keys = local.sshkey
  }

  #defined_tags = var.defined_tags
  #timeouts {
  #  create = "60m"
  #}
}
