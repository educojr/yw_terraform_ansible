resource "null_resource" "lb_provisioner" {
  triggers = {
    cluster_instance_ids = "${aws_instance.lb_whoami.id}"
  }
  provisioner "local-exec" {
    command = "sleep 90; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${aws_eip.ip_pub_lb_whoami.public_ip},' prov/docker_install.yml"
  }
}
