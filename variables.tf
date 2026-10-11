variable "budget_alert_rules" {
  description = <<EOT
Map of budget_alert_rules, attributes below
Required:
    - budget_id
    - threshold
    - threshold_type
    - type
Optional:
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - message
    - recipients
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    budget_id      = string
    threshold      = number
    threshold_type = string
    type           = string
    defined_tags   = optional(map(string))
    description    = optional(string)
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    message        = optional(string)
    recipients     = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

