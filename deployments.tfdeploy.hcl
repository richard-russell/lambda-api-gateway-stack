# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "production" {
  variables = {
    region              = "eu-west-1"
    role_arn            = "arn:aws:iam::363715248670:role/tfc-workload-identity-richard-russell-org"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "lambda-api-gateway-stack" }
  }
}
