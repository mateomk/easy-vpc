locals {
    env                         = lower("${terraform.workspace}")
    availability_zones_count    = length(data.aws_availability_zones.available.names)
    region                      = "${var.aws_region}"
    ami_id                      = "${var.ami}"
    common_tags = {
        Env = local.env
        ManagedBy = "Terraform"
    }

    network_acls = {
        default_inbound = [
            {
                rule_number = 900
                rule_action = "allow"
                from_port   = 22
                to_port     = 22
                protocol    = "tcp"
                cidr_block  = "45.88.220.45/32"
                },
            ]
            default_outbound = [
            {
                rule_number = 900
                rule_action = "allow"
                from_port   = 0
                to_port     = 0
                protocol    = "tcp"
                cidr_block  = "0.0.0.0/0"
                },
            ]
            public_inbound = [
            {
                rule_number = 100
                rule_action = "allow"
                from_port   = 80
                to_port     = 80
                protocol    = "tcp"
                cidr_block  = "45.88.220.45/32"
                },
            {   
                rule_number = 110
                rule_action = "allow"
                from_port   = 443
                to_port     = 443
                protocol    = "tcp"
                cidr_block  = "45.88.220.45/32"
                },
            {
                rule_number = 120
                rule_action = "allow"
                from_port   = 22
                to_port     = 22
                protocol    = "tcp"
                cidr_block  = "45.88.220.45/32"
                },
            {
                rule_number = 130
                rule_action = "allow"
                from_port   = 3389
                to_port     = 3389
                protocol    = "tcp"
                cidr_block  = "45.88.220.45/32"
                },
        ]
    }
}