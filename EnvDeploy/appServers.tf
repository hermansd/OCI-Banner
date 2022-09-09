# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

locals{ 
  fault_domain = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
}


resource "oci_core_instance" "appServer" {
  count               = var.host_count
  availability_domain = var.multiple_ads ? (contains(range(1,var.host_count , 2), count.index) ? var.target_ad2 : var.target_ad1) : var.target_ad1
  fault_domain        = var.random_fds ? element(local.fault_domain,count.index): ((contains(range(1,var.host_count , 2), count.index)) ? var.target_fd2 : var.target_fd1)
  compartment_id      = var.target_compartment_ocid
  display_name        = "${var.service_label}app${count.index}"
  shape               = var.shape_name

  shape_config {
    ocpus = var.host_ocpus
    memory_in_gbs = var.host_memmory
  }

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    display_name     = "${var.service_label}app${count.index}"
    assign_public_ip = var.assign_public_ip
    hostname_label   = "${var.service_label}app${count.index}"
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
