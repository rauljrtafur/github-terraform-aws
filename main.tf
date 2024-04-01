terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAW3MEDYFJP6WLPKHW"
  secret_key = "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"
}


resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "String"
  value = "bar"

}

resource "aws_ssm_parameter" "foo2" {
  name  = "foo"
  type  = "String"
  value = "bar"

}
