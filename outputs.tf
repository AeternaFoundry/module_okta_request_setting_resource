output "request_setting_resources_id" {
  description = "Map of id values across all request_setting_resources, keyed the same as var.request_setting_resources except keys with no id are omitted"
  value       = { for k, v in okta_request_setting_resource.request_setting_resources : k => v.id if v.id != null && length(v.id) > 0 }
}
output "request_setting_resources_request_on_behalf_of_settings" {
  description = "Map of request_on_behalf_of_settings values across all request_setting_resources, keyed the same as var.request_setting_resources except keys with no request_on_behalf_of_settings are omitted"
  value       = { for k, v in okta_request_setting_resource.request_setting_resources : k => v.request_on_behalf_of_settings if v.request_on_behalf_of_settings != null && length(v.request_on_behalf_of_settings) > 0 }
}
output "request_setting_resources_risk_settings" {
  description = "Map of risk_settings values across all request_setting_resources, keyed the same as var.request_setting_resources except keys with no risk_settings are omitted"
  value       = { for k, v in okta_request_setting_resource.request_setting_resources : k => v.risk_settings if v.risk_settings != null && length(v.risk_settings) > 0 }
}

