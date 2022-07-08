# Gets a list of all Oracle Linux 7.5 images that support a given Instance shape
data "oci_core_images" "supported_shape_images" {
  compartment_id   = var.tenancy_ocid
  shape            = "VM.Standard.E3.Flex" #var.instance_shape
  operating_system = "Oracle Linux"

#  filter {
#    name   = "launch_options.is_pv_encryption_in_transit_enabled"
#    values = ["true"]
#  }
}