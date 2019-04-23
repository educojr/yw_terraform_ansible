#resource "aws_vpc" "vpc_whoami" {
#  cidr_block = "10.0.0.0/16"
#  instance_tenancy = "dedicated"
#  enable_dns_hostnames = "true"
#  tags = { Name = "Whoami - VPC" }
#}

#resource "aws_subnet" "subnet_whoami" {
#  vpc_id = "${aws_vpc.vpc_whoami.id}"
#  cidr_block = "10.0.1.0/28"
#  tags = { Name = "Whoami - Subnet" }
#}

resource "aws_security_group" "fw_ssh_whoami" {
  tags = { Name = "Whoami - SSH access" }
  name  = "fw_ssh_whoami"
  description = "Whoami - SSH access"
#  vpc_id = "${aws_vpc.vpc_whoami.id}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.ip_range_ssh_access}"]
  }
}

resource "aws_security_group" "fw_http_whoami" {
  tags = { Name = "Whoami - HTTP access" }
  name = "fw_http_whoami"
  description = "Whoami - HTTP access"
#  vpc_id = "${aws_vpc.vpc_whoami.id}"
  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "fw_output_default_whoami" {
  tags = { Name = "Whoami - Output access default" }
  name = "fw_output_whoami"
  description = "Whoami - Output access default"
#  vpc_id = "${aws_vpc.vpc_whoami.id}"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#resource "aws_security_group" "fw_input_priv_default_whoami" {
#  tags = { Name = "Whoami - Input access default" }
#  name = "fw_input_whoami"
#  description = "Whoami - Input access default"
#  vpc_id = "${aws_vpc.vpc_whoami.id}"
#  ingress {
#    from_port = 0
#    to_port = 0
#    protocol = "-1"
#    cidr_blocks = ["${aws_vpc.default.cidr_block}"]
#  }
#}

resource "aws_eip" "ip_pub_lb_whoami" {
  tags = { Name = "Whoami - Public IP Loadbalance" }
  instance = "${aws_instance.lb_whoami.id}"
}

resource "aws_eip" "ip_pub_app1_whoami" {
  tags = { Name = "Whoami - Public IP App1" }
  instance = "${aws_instance.app1_whoami.id}"
}

resource "aws_eip" "ip_pub_app2_whoami" {
  tags = { Name = "Whoami - Public IP App2" }
  instance = "${aws_instance.app2_whoami.id}"
}