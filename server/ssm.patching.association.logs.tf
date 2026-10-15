resource "aws_s3_bucket" "logs" {
  bucket        = "logs-bucket-nsse"
  force_destroy = true
  tags          = var.tags
}


resource "aws_s3_bucket_policy" "allow_access_from_instances" {
  bucket = aws_s3_bucket.logs.id
  policy = data.aws_iam_policy_document.allow_access_from_instances.json
}

data "aws_iam_policy_document" "allow_access_from_instances" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.instance_role.arn]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.logs.arn,
      "${aws_s3_bucket.logs.arn}/*",
    ]
  }
}
