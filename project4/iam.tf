resource "aws_iam_user" "s3_reader" {
  name          = var.iam_user_name
  force_destroy = true

  tags = {
    Project = "Capstone-Project-4"
  }
}

resource "aws_iam_user_policy" "s3_read_access" {
  name   = "${var.iam_user_name}-s3-read-policy"
  user   = aws_iam_user.s3_reader.name
  policy = var.s3_read_policy
}
