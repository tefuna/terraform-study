# -----------------------------------------------------------------------------
# Terraform Configuration.
# -----------------------------------------------------------------------------
terraform {
  required_version = ">=1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.18"
    }
  }
}

# -----------------------------------------------------------------------------
# Provider
# -----------------------------------------------------------------------------
provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

# TODO tsstate move to terraform cloud
