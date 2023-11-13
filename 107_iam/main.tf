terraform {
  required_version = ">=1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.18"
    }
  }

  cloud {
    organization = "aws_isid_learn145"
    hostname     = "app.terraform.io"
    workspaces {
      name = "terraform-study-iam"
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
