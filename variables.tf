variable "aws_region" {
  type    = string
  default = "us-east-1"
}

locals {
  routes = {
    "index" : {
      name : "index"
      http_verb : "GET"
      path = "/"
      policies : "logs:List*",
      resource : "arn:aws:logs:*:*:*"

    },
    "profile-get" : {
      name : "profile-get"
      http_verb : "GET"
      path = "/profile"
      policies : ["dynamodb:Scan"]
      resource : [aws_dynamodb_table.profile.arn]
    },
    "profile-post" : {
      name : "profile-post"
      http_verb : "POST"
      path = "/profile"
      policies : ["dynamodb:PutItem", "dynamodb:Scan"]
      resource : [aws_dynamodb_table.profile.arn]
    }
  }
}