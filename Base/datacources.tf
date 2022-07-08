# Gets a list of all Oracle Linux 7.5 images that support a given Instance shape
data "oci_core_images" "supported_shape_images" {
  compartment_id   = ${tenancy_ocid}
  shape            = "VM.Standard.E3.Flex" #var.instance_shape
  operating_system = "Oracle Linux"

#  filter {
#    name   = "launch_options.is_pv_encryption_in_transit_enabled"
#    values = ["true"]
#  }
}


data "oci_core_vcns" "this_vcn" {
  compartment_id   = "ocid1.compartment.oc1..aaaaaaaawa6zpqbwer44tocvotkzytddtobk65h3vbo6g3juxzs2huz2sy7q"
  #shape            = "VM.Standard.E3.Flex" #var.instance_shape
  #operating_system = "Oracle Linux"

#  filter {
#    name   = "launch_options.is_pv_encryption_in_transit_enabled"
#    values = ["true"]
#  }
}