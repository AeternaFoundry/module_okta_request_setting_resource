output "request_setting_resources_id" {
  description = "Map of id values across all request_setting_resources, keyed the same as var.request_setting_resources"
  value       = { for k, v in okta_request_setting_resource.request_setting_resources : k => v.id }
}
output "request_setting_resources_request_on_behalf_of_settings" {
  description = "Map of request_on_behalf_of_settings values across all request_setting_resources, keyed the same as var.request_setting_resources"
  value       = { for k, v in okta_request_setting_resource.request_setting_resources : k => v.request_on_behalf_of_settings }
}
output "request_setting_resources_risk_settings" {
  description = "Map of risk_settings values across all request_setting_resources, keyed the same as var.request_setting_resources"
  value       = { for k, v in okta_request_setting_resource.request_setting_resources : k => v.risk_settings }
}

