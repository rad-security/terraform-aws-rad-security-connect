terraform {
  required_providers {
    rad-security = {
      source  = "rad-security/rad-security"
      version = "1.0.3"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

provider "rad-security" {
  access_key_id = var.ksoc_access_key_id
  secret_key    = var.ksoc_secret_key
}

module "rad-security-connect" {
  # https://registry.terraform.io/modules/rad-security/rad-security-connect/aws/latest
  source  = "rad-security/rad-security-connect/aws"
  version = "<version>"

  enable_ecr_image_pull = true

  # Optional: limit pulls to selected repositories (defaults to all repositories in the account)
  # ecr_repository_arns = [
  #   "arn:aws:ecr:us-west-2:111122223333:repository/my-service",
  #   "arn:aws:ecr:us-west-2:111122223333:repository/team-a/*",
  # ]
}
