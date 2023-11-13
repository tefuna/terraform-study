terraform {
  required_version = ">=1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.18"
    }
  }
}

provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

module "webserver" {
  source        = "./modules/nginx-server"
  instance_type = "t2.micro"
}

output "webserver_id" {
  value = module.webserver.instance_id
}
