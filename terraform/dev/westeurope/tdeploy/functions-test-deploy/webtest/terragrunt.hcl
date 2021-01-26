dependency "fuction_app" {
  config_path = "../function-app"
}

dependency "resource_group" {
  config_path = "../../resource_group"
}

dependency "application_insights" {
  config_path = "../../application_insights"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  source = "/Users/pasqualedevita/Documents/github/io-infrastructure-modules-new/azurerm_application_insights_web_test"
}

inputs = {
  name                    = "fn3tdeploy"
  resource_group_name     = dependency.resource_group.outputs.resource_name
  application_insights_id = dependency.application_insights.outputs.id
  
  kind                = "ping"
  enabled             = true
  url                 = "https://${dependency.fuction_app.outputs.default_hostname}/info"
}
