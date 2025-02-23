output "availability_zones" {
    value = data.aws_availability_zones.available.names
}

output "environment" {
    value = "${local.env}"
}

output "az_count" {
    value = "${local.availability_zones_count}"
}