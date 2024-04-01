variable "jwtSecret" {
  description = "JWT Secret"
  sensitive   = true
}

variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "aws_s3_bucket" {
  description = "S3 Bucket for Zip"
}
