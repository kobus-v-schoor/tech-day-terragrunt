generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    assume_role {
      # role_arn = "arn:aws:iam::0123456789:role/terragrunt"
    }

    # allowed_account_ids = ["123456"]
  }
  EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "techday-terragrunt-demo"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "af-south-1"
    encrypt        = true
  }
}

