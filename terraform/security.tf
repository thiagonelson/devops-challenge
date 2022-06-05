resource "aws_security_group" "sg_loadbalance" {  
    name  = "sg_loadbalance"
    description = "Allow HTTP/S and SSH"

    ingress {
        description = "HTTP usage"
        from_port = 80
        to_port = 80
        protocol_tcp = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        description = "HTTPS usage"
        from_port = 443
        to_port = 443
        protocol_tcp = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
}
