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
  region = "us-east-1"
}


resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "String"
  value = "bar"

}

resource "aws_ssm_parameter" "foo2" {
  name  = "foo2"
  type  = "String"
  value = "bar"

}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "image-generate-buckets3"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

