terraform {
  backend "s3" {
    # bucket = "github-terraform-aws-dev" # change to name of your bucket
    # region = "us-east-1"                # change to your region
    # key    = "infra.tfstate"
  }
}
