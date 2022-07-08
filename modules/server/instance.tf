// Copyright (c) 2017, 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Mozilla Public License v2.0


resource "oci_core_instance" "instance" {
  count               = var.num_instances
  availability_domain = var.avalability_domain
  fault_domain        = var.fault_domain
  compartment_id      = var.compartment_ocid
  display_name        = "letmework"
  shape               = var.shape

  shape_config {
    ocpus = var.ocpus
  }

  create_vnic_details {
    subnet_id        = var.subnet_ocid
    display_name     = "Primaryvnic"
    assign_public_ip = var.assign_public_ip
    hostname_label   = "${var.display_name}${count.index}"
  }

  source_details {
    source_type = "image"
    source_id   = var.image_ocid

  }

  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  #preserve_boot_volume = true

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }

  #defined_tags = var.defined_tags
  #timeouts {
  #  create = "60m"
  #}
}

resource "oci_core_volume" "block_volume_paravirtualized" {
  #count               = var.num_instances * var.num_volumes
  availability_domain = var.avalability_domain
  compartment_id      = var.compartment_ocid
  display_name        = "BlockParavirtualized"
  size_in_gbs         = var.attached_volume_size
  #defined_tags        = {"Automation.CtreatedBy":"Terraform"}
}

resource "oci_core_volume_attachment" "block_volume_attach_paravirtualized" {
  count           = var.num_instances * var.num_volumes
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.instance.*.id[floor(count.index / var.num_instances)]
  volume_id       = oci_core_volume.block_volume_paravirtualized.*.id[count.index]
}