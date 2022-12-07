include "root" {
  path = find_in_parent_folders()
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env_name = local.env_vars.locals.env
}

terraform {
  source = "../../../modules//secret"
}

inputs = {
  name = "to-life-and-everything-${local.env_name}-1"
  value = "42"
}
