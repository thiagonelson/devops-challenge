data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "loadbalance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "devops-key"
  security_groups = [aws_security_group.sg_loadbalance.name]
  tags = {
    Name = "LoadBalancer"
    App  = "HAProxy"
  }
}
