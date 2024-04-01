variable "jwtSecret" {
  description = "JWT Secret"
  sensitive   = true
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}
