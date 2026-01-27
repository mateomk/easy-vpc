resource "aws_security_group" "ssh_access_sg" {
    name    = "ssh_access_from_home_ip"
    description = "Allow SSH inbound traffic from a specific IP"
    vpc_id = local.vpc_id
    tags = local.common_tags

    ingress {
        from_port = local.network_acls.default_inbound.from_port
        to_port = local.network_acls.default_inbound.to_port
        protocol = local.network_acls.default_inbound.ip_protocol
        cidr_blocks = [local.network_acls.default_inbound.cidr_block]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}