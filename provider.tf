terraform {
  backend "s3" {
    bucket = "amrforcloud1"
    key    = "state"
    region = "eu-west-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}
