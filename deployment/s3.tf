resource "aws_s3_bucket" "voice_bucket" {
  bucket  = "${var.account_no}-gazeplay-voices"
  acl     = "public-read"
}