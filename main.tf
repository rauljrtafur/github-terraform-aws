terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "github-terraform-aws-dev" # change to name of your bucket
    region = "us-west-1"                # change to your region
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
}


resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "String"
  value = "bar"

}

resource "aws_s3_bucket" "image-generate" {
  bucket = "image-generate"

  tags = {
    Environment = "Prod"
  }
}