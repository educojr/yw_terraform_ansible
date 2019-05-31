variable "aws_region" { default = "us-east-1" }

variable "youraccesskey" {
    default = "AKIAWBDVKRIRRMDNBHXS"
}

variable "yoursecretkey" {
    default = "cK0iV4DsnkczlflkqbeqI4+kdchDDCEAMKSB6dfy"
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

#variable "ip_pub_lb_whoami" {
#    default = "${aws_eip.ip_pub_lb_whoami.public_ip}"
#}


#data "aws_vpc" "default" {
#    filter {
#        name = "group name"
#        values = ["default"]
#    }
#}
