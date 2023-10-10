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

  # backend "s3" {
  #   bucket  = "tastylog-tsstate-bucket-tfunayama"
  #   key     = "tastylog-dev.tfstate"
  #   region  = "ap-northeast-1"
  #   profile = "terraform"
  # }
  cloud {
    organization = "aws_isid_learn145"
    hostname     = "app.terraform.io"
    workspaces {
      name = "terraform-study"
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

variable "domain" {
  type = string
}
