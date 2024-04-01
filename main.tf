terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "github-terraform-aws-dev" # change to name of your bucket
    region = "us-east-1"                # change to your region
    key    = "infra.tfstate"
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW3MEDYFJP6WLPKHW"
  secret_key = "KoAacZTgLgDvYiYUeGhiDn1hVQFETqMC1JDGhk1D"
}


resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "String"
  value = "bar"

}

resource "aws_s3_bucket" "image-generate" {
  bucket = "image-generate-buckets3"

  tags = {
    Environment = "Prod"
  }
}