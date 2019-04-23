provider "aws" {
    access_key = "${var.youraccesskey}"
    secret_key = "${var.yoursecretkey}"
    region = "${var.aws_region}"
}