# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


resource "oci_core_instance" "appServer" {
  count               = var.app_host_count
  availability_domain = var.app_multiple_ads ? (contains(range(1,var.app_host_count , 2), count.index) ? var.app_target_ad2 : var.target_ad1) : var.target_ad1
  fault_domain        = var.app_multiple_fds ? ((contains(range(1,var.app_host_count , 2), count.index)) ? var.app_target_fd2 : var.app_target_fd1) : element(var.fault_domain,count.index)
  compartment_id      = var.target_compartment_ocid
  display_name        = "${var.app_service_label}app${count.index}"
  shape               = var.app_shape_name

  shape_config {
    ocpus = var.app_host_ocpus
    memory_in_gbs = var.app_host_memmory
  }

  create_vnic_details {
    subnet_id        = var.app_subnet_ocid
    display_name     = "${var.app_service_label}app${count.index}"
    assign_public_ip = var.app_assign_public_ip
    hostname_label   = "${var.app_service_label}app${count.index}"
  }

  source_details {
    source_type = "image"
    source_id   = var.app_os_image_ocid

  }

  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  #preserve_boot_volume = true

  metadata = {
    ssh_authorized_keys = var.app_change_ssh ? var.app_sshkey : var.sshkey
  }

  #defined_tags = var.defined_tags
  #timeouts {
  #  create = "60m"
  #}
}
