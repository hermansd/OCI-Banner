module "dns_server2" {
 // count               = 2
  source              = "../modules/server"
  tenancy_ocid        = var.tenancy_ocid
  num_instances       = 1
  shape               = var.shape_name
  ocpus               = 1
  image_ocid          = var.os_image_ocid
  avalability_domain  = data.oci_identity_availability_domain.ad[2].name
  compartment_ocid    = var.target_compartment_ocid
  display_name        = "DNS2"
  subnet_ocid         = var.subnet_ocid
  assign_public_ip    = false
  ssh_public_key      = var.sshkey
  #defined_tags        = {"Automation.CtreatedBy":"Terraform","Automation.Environment":"Prodcution","Automation.Type0":"DNS"}
} 