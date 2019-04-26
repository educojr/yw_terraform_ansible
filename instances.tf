resource "aws_instance" "lb_whoami" {
    tags = { Name = "Whoami - LoadBalancer" }
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.kp_ssh_whoami.key_name}"
    security_groups = [
        "${aws_security_group.fw_ssh_whoami.name}",
        "${aws_security_group.fw_http_whoami.name}",
#        "${aws_security_group.fw_input_priv_default_whoami.id}",
        "${aws_security_group.fw_output_default_whoami.name}"
    ]
    provisioner "local-exec" {
        command = "sleep 90; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${aws_instance.lb_whoami.public_ip},' prov/docker_install.yml"
    }
}

resource "aws_instance" "app1_whoami" {
    tags = { Name = "Whoami - App1" }
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.kp_ssh_whoami.key_name}"
    security_groups = [
        "${aws_security_group.fw_ssh_whoami.name}",
#        "${aws_security_group.fw_input_priv_default_whoami.id}",
        "${aws_security_group.fw_output_default_whoami.name}"
    ]
}

resource "aws_instance" "app2_whoami" {
    tags = { Name = "Whoami - App2" }
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.kp_ssh_whoami.key_name}"
    security_groups = [
        "${aws_security_group.fw_ssh_whoami.name}",
#        "${aws_security_group.fw_input_priv_default_whoami.id}",
        "${aws_security_group.fw_output_default_whoami.name}"
    ]
}
