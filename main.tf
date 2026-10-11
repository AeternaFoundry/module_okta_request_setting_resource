resource "okta_request_setting_resource" "request_setting_resources" {
  for_each = var.request_setting_resources

  id = each.value.id

  dynamic "request_on_behalf_of_settings" {
    for_each = each.value.request_on_behalf_of_settings != null ? each.value.request_on_behalf_of_settings : []
    content {
      allowed = request_on_behalf_of_settings.value.allowed
      dynamic "only_for" {
        for_each = request_on_behalf_of_settings.value.only_for != null ? request_on_behalf_of_settings.value.only_for : []
        content {
          type = only_for.value.type
        }
      }
    }
  }

  dynamic "risk_settings" {
    for_each = each.value.risk_settings != null ? each.value.risk_settings : []
    content {
      dynamic "default_setting" {
        for_each = risk_settings.value.default_setting != null ? risk_settings.value.default_setting : []
        content {
          dynamic "access_duration_settings" {
            for_each = default_setting.value.access_duration_settings != null ? default_setting.value.access_duration_settings : []
            content {
              duration = access_duration_settings.value.duration
              type     = access_duration_settings.value.type
            }
          }
          approval_sequence_id    = default_setting.value.approval_sequence_id
          request_submission_type = default_setting.value.request_submission_type
        }
      }
    }
  }
}

