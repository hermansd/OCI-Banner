data "oci_identity_availability_domains" "AD" {
  compartment_id = var.tenancy_ocid
}
