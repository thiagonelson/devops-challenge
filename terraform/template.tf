data "template_file" "inventory" {
    template = file("./templates/infra.tpl")
    vars = {
        lb_ip = "${join("\n", [for instance in aws_instance.loadbalance : join("", [instance.ipv4_address, " internal_ip=", instance.ipv4_address_private, " ansible_ssh_private_key_file=", var.pvt_key])])}"
    }
}

resource "local_file" "inventory_file" {
  content  = data.template_file.inventory.rendered
  filename = "../inventory/cluster/hosts.ini"
}
