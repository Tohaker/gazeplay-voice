resource "aws_lambda_function" "voice_function" {
  filename          = "../build/distributions/${var.package_name}"
  source_code_hash  = filebase64sha256("../build/distributions/${var.package_name}")
  handler           = "net.gazeplay.voice.StreamLambdaHandler"

  function_name     = var.lambda_function_name
  role              = aws_iam_role.lambda_voice.arn

  runtime           = "java11"
  timeout           = 10
}

resource "aws_cloudwatch_log_group" "voice_logs" {
  name = "/aws/lambda/${var.lambda_function_name}"
}

resource "aws_lambda_permission" "allow_execution_from_gateway" {
  statement_id  = "AllowExecutionFromAPIGatewayRedirect"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.voice_function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn    = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.api_gateway.id}/*/${aws_api_gateway_method.voice_method.http_method}${aws_api_gateway_resource.voice_api_resource.path}"
}
