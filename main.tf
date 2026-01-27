

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = upper("VPC-EKS-${local.env}")

    cidr = "${var.vpc_cidr_block}"
    azs = slice(data.aws_availability_zones.available.names, 0, "${local.availability_zones_count}")

    public_subnets = slice(var.public_subnet_cidr_blocks, 0, "${local.availability_zones_count}")
    private_subnets = slice(var.private_subnet_cidr_blocks, 0, "${local.availability_zones_count}")

    single_nat_gateway = true
    enable_nat_gateway = true
    one_nat_gateway_per_az = false
    manage_default_network_acl = true

    public_dedicated_network_acl = true
    #public_inbound_acl_rules = local.network_acls["default_inbound"]
    #public_outbound_acl_rules = local.network_acls["default_outbound"]

    private_dedicated_network_acl = false

    tags = local.common_tags
}