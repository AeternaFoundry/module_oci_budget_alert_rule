resource "oci_budget_alert_rule" "budget_alert_rules" {
  for_each = var.budget_alert_rules

  budget_id      = each.value.budget_id
  threshold      = each.value.threshold
  threshold_type = each.value.threshold_type
  type           = each.value.type
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags
  message        = each.value.message
  recipients     = each.value.recipients

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

