terraform {
  required_version = ">=1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags = {
    Project     = "terraform_ecs"
    Environment = "stg"
    ManagedBy   = "Terraform"
    Owner       = "mnmkksgsrg"
  }
}



