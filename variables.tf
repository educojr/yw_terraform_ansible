variable "aws_region" { default = "us-east-1" }

variable "youraccesskey" {
}

variable "yoursecretkey" {
}

variable "ip_range_ssh_access" {
    default = "0.0.0.0/0"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

#data "aws_vpc" "default" {
#    filter {
#        name = "group name"
#        values = ["default"]
#    }
#}
