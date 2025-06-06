terraform {

  backend "remote" {

    organization = "ShakilOps"

    workspaces {
      name = "CNC-awsECS"
    }

  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = "1.12.1"

}
