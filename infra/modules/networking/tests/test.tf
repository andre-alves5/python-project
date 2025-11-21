terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "test_vpc" {
  source = "../" # Go up to the module root

  env            = "test"
  project        = "eloquent"
  vpc-cidr-block = "10.1.0.0/16"

  private-subnets = {
    "priv1" = { cidr = "10.1.1.0/24", az = "us-east-1a" }
  }
  public-subnets = {
    "pub1" = { cidr = "10.1.101.0/24", az = "us-east-1a" }
  }
}
