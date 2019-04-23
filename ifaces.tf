#resource "aws_network_interface" "iface_lb" {
#  subnet_id = "${aws_subnet.subnet_whoami.id}"
#  attachment {
#    instance = "${aws_instance.lb_whoami.id}"
#    device_index = 0
#  }
#}

#resource "aws_network_interface" "iface_app1" {
#  subnet_id = "${aws_subnet.subnet_whoami.id}"
#  attachment {
#    instance = "${aws_instance.app1_whoami.id}"
#    device_index = 0
#  }
#}

#resource "aws_network_interface" "iface_app2" {
#  subnet_id = "${aws_subnet.subnet_whoami.id}"
#  attachment {
#    instance = "${aws_instance.app2_whoami.id}"
#    device_index = 0
#  }
#}

#resource "aws_network_interface_attachment" "iface_attach_lb" {
#  instance_id          = "${aws_instance.lb_whoami.id}"
#  network_interface_id = "${aws_network_interface.iface_lb.id}"
#  device_index         = 0
#}

#resource "aws_network_interface_attachment" "iface_attach_app1" {
#  instance_id          = "${aws_instance.app1_whoami.id}"
#  network_interface_id = "${aws_network_interface.iface_app1.id}"
#  device_index         = 0
#}


#resource "aws_network_interface_attachment" "iface_attach_app2" {
#  instance_id          = "${aws_instance.app2_whoami.id}"
#  network_interface_id = "${aws_network_interface.iface_app2.id}"
#  device_index         = 0
#}
