locals {
    env                         = lower("${terraform.workspace}")
    availability_zones_count    = length(data.aws_availability_zones.available.names)
    region                      = "${var.aws_region}"
    #ami_id                      = "${var.ami}"
    vpc_id                      = module.vpc.default_vpc_id
    common_tags = {
        Env = local.env
        ManagedBy = "Terraform"
    }

    network_acls = {
        default_inbound = {
            from_port = 22
            to_port = 22
            ip_protocol = "tcp"
            cidr_block = "45.88.220.45/32"
        }
        default_outbound = {
            from_port = 0
            to_port = 0
            ip_protocol = "tcp"
            cidr_block = "0.0.0.0/0"            
        }
    }
}