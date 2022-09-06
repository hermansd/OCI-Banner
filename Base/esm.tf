# Copyright (c) 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#module "esm_server" {
#  //count               = 1
#  source              = "../modules/server"
# tenancy_ocid        = var.tenancy_ocid
#  num_instances       = 1
#  shape               = var.shape_name
#  ocpus               = 1
#  image_ocid          = var.os_image_ocid
#  avalability_domain  = var.target_ad
#  compartment_ocid    = var.target_compartment_ocid
#  display_name        = "DNS2"
#  subnet_ocid         = var.subnet_ocid
#  assign_public_ip    = false
#  ssh_public_key      = var.sshkey
  #defined_tags        = {"Automation.CtreatedBy":"Terraform","Automation.Environment":"Prodcution","Automation.Type0":"DNS"}
#} 


resource "oci_core_instance" "esm01" {
  #count               = var.num_instances
  availability_domain = var.target_ad
  #fault_domain        = var.fault_domain
  compartment_id      = var.target_compartment_ocid
  display_name        = "${var.service_label}esm01"
  shape               = var.shape_name

  shape_config {
    ocpus = var.host_ocpus
    memory_in_gbs = var.host_memmory
  }

  create_vnic_details {
    subnet_id        = var.host_ocpus
    display_name     = "${var.service_label}esm01"
    assign_public_ip = "false"
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

resource "oci_core_volume" "block_volume_paravirtualized" {
  #count               = var.num_instances * var.num_volumes
  availability_domain = var.target_ad
  compartment_id      =  var.target_compartment_ocid
  display_name        = "${var.service_label}esm01"
  size_in_gbs         = 100 #var.attached_volume_size
  #defined_tags        = {"Automation.CtreatedBy":"Terraform"}
}

resource "oci_core_volume_attachment" "block_volume_attach_paravirtualized" {
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.esm01.id
  volume_id       = oci_core_volume.block_volume_paravirtualized.id
}