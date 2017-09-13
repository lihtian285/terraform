provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

resource "aws_iam_user" "user" {
    name = "fr_test_user01"
    path = "/"
}
