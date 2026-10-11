data "oci_iot_iot_domain_groups" "iot_iot_domain_groups_lookup" {
  for_each = var.iot_iot_domain_groups_lookup

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  state          = each.value.state
  type           = each.value.type

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

