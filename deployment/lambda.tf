resource "aws_lambda_function" "voice_function" {
  filename          = "../build/distributions/${var.package_name}"
  source_code_hash  = filebase64sha256("../build/distributions/${var.package_name}")
  handler           = "net.gazeplay.voice.StreamLambdaHandler"

  function_name     = var.lambda_function_name
  role              = aws_iam_role.lambda_voice.arn

  runtime           = "java11"
  timeout           = 10
}
