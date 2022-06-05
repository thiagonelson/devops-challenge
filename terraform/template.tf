data "template_file" "inventory" {
    template = file("./templates/infra.tpl")
    vars = {
        lb_ip = "${join("", [aws_instance.loadbalance.public_ip," internal_ip=", aws_instance.loadbalance.private_ip, " ansible_ssh_private_key_file=", var.pvt_key])}"
        db_rds_ip = ""
        k8s_node_ip = ""
    }
}

resource "local_file" "inventory_file" {
  content  = data.template_file.inventory.rendered
  filename = "../inventory/cluster/hosts.ini"
}
