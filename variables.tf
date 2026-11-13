variable "request_setting_resources" {
  description = <<EOT
Map of request_setting_resources, attributes below
Required:
    - id
Optional:
    - request_on_behalf_of_settings (block):
        - allowed (optional)
        - only_for (optional, block):
            - type (optional)
    - risk_settings (block):
        - default_setting (optional, block):
            - access_duration_settings (optional, block):
                - duration (optional)
                - type (optional)
            - approval_sequence_id (optional)
            - request_submission_type (optional)
EOT

  type = map(object({
    id = string
    request_on_behalf_of_settings = optional(list(object({
      allowed = optional(bool)
      only_for = optional(list(object({
        type = optional(string)
      })))
    })))
    risk_settings = optional(list(object({
      default_setting = optional(list(object({
        access_duration_settings = optional(list(object({
          duration = optional(string)
          type     = optional(string)
        })))
        approval_sequence_id    = optional(string)
        request_submission_type = optional(string)
      })))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.request_setting_resources : (
        v.risk_settings == null || alltrue([for item in v.risk_settings : (item.default_setting == null || alltrue([for item in item.default_setting : (item.access_duration_settings == null || alltrue([for item in item.access_duration_settings : (item.type == null || (contains(["ADMIN_FIXED_DURATION", "REQUESTER_SPECIFIED_DURATION"], item.type)))]))]))])
      )
    ])
    error_message = "must be one of: \"ADMIN_FIXED_DURATION\", \"REQUESTER_SPECIFIED_DURATION\""
  }
}

