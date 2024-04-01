terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    # bucket = "github-terraform-aws-dev" # change to name of your bucket
    # region = "us-west-1"                # change to your region
    # key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
  access_key = "AKIAW3MEDYFJKJUTULXB"
  secret_key = "bnXXVVS3Rf4TQYt0F23YKMJPmGhMk010SeEla/kZ"
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