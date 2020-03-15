resource "aws_api_gateway_rest_api" "api_gateway" {
  name = "GazePlay-Voice-Gateway"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "voice_api_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "voice"
}

resource "aws_api_gateway_method" "voice_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.voice_api_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "redirect_integration" {
  rest_api_id               = aws_api_gateway_rest_api.api_gateway.id
  resource_id               = aws_api_gateway_resource.voice_api_resource.id
  http_method               = aws_api_gateway_method.voice_method.http_method
  integration_http_method   = "POST"
  type                      = "AWS_PROXY"
  uri                       = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${aws_lambda_function.voice_function.arn}/invocations"
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_method.voice_method
  ]

  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  stage_name    = "dev"
  description   = "Development API for GazePlay Voice API"
}
