variable "account_no" {
  description = "The account number under which this project will be deployed. This determines some unique resource names"
  default     = "021651181835"
}

variable "region" {
  description = "The AWS region to deploy in"
  default     = "eu-west-2"
}

variable "package_name" {
  description = "Name of the compiled code package to upload to the Lambda"
  default     = "voice-0.0.1-SNAPSHOT.zip"
}

variable "lambda_function_name" {
  description = "Name given to the Lambda function"
  default     = "gazeplay-voice-api"
}
