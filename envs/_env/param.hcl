locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env_name = local.env_vars.locals.env
}

terraform {
  source = "../../../modules//parameter"
}

dependency "secret" {
  config_path = "../secret"
}

inputs = {
  env = local.env_name
  value = dependency.secret.outputs.arn
}
