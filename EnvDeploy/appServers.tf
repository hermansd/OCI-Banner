# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

locals{ 
  fault_domain = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
  host_count =       var.app_host_count
  multiple_ads =     var.app_multiple_ads
  target_ad1 =       var.target_ad1
  target_ad2 =       var.app_target_ad2
  multiple_fds =     var.app_multiple_fds
  target_fd1 =       var.app_target_fd1
  target_fd2 =       var.app_target_fd2
  compartment_ocid = var.target_compartment_ocid
  service_label =    var.service_label
  shape_name =       var.app_shape_name
  host_ocpus =       var.app_host_ocpus
  host_memmory =     var.app_host_memmory
  os_image_ocid =    var.app_os_image_ocid
  subnet_ocid =      var.app_subnet_ocid
  assign_public_ip = var.app_assign_public_ip
}


resource "oci_core_instance" "appServer" {
  count               = local.host_count
  availability_domain = local.multiple_ads ? (contains(range(1,local.host_count , 2), count.index) ? local.target_ad2 : local.target_ad1) : local.target_ad1
  fault_domain        = local.multiple_fds ? ((contains(range(1,local.host_count , 2), count.index)) ? local.target_fd2 : local.target_fd1) : element(local.fault_domain,count.index)
  compartment_id      = local.compartment_ocid
  display_name        = "${local.service_label}app${count.index}"
  shape               = local.shape_name

  shape_config {
    ocpus = local.host_ocpus
    memory_in_gbs = local.host_memmory
  }

  create_vnic_details {
    subnet_id        = local.subnet_ocid
    display_name     = "${local.service_label}app${count.index}"
    assign_public_ip = local.assign_public_ip
    hostname_label   = "${local.service_label}app${count.index}"
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
