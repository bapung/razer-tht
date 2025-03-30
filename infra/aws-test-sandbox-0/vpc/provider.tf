terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
  shared_credentials_files = ["/home/bapung/.aws/sandbox-creds"]
  profile = "378679034469_AWSAdministratorAccess"
}