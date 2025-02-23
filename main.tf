provider "aws" {
    region = "${var.aws_region}"
}

data "aws_availability_zones" "available" {
    state = "available" 
    filter {
        name   = "opt-in-status"
        values = ["opt-in-not-required"]
    }
}

locals {
    env = lower("${terraform.workspace}")
    availability_zones_count = length(data.aws_availability_zones.available.names)
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "myapp-${local.env}"

    cidr = "${var.vpc_cidr_block}"
    azs = slice(data.aws_availability_zones.available.names, 0, "${local.availability_zones_count}")

    public_subnets = slice(var.public_subnet_cidr_blocks, 0, "${local.availability_zones_count}")
    private_subnets = slice(var.private_subnet_cidr_blocks, 0, "${local.availability_zones_count}")

    single_nat_gateway = true
    enable_nat_gateway = true
    one_nat_gateway_per_az = false
}