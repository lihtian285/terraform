// Provider specific configs
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

// EC2 Instance Resource for Module
resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
//    count = "${var.number_of_instances}"
    instance_type = "t2.micro"
    tags {
        Name = "sample terraform testing"
    }
}
