data "aws_availability_zones" "available" {
    state = "available" 
    filter {
        name   = "opt-in-status"
        values = ["opt-in-not-required"]
    }
}

#data "aws_vpc" "default" {
#    filter {
#        name = "tag:Name"
#        values = [upper("VPC-EKS-${local.env}")]
#   }
#}