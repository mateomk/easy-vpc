resource "aws_security_group" "ssh_access_sg" {
    name    = "ssh_access_from_home_ip"
    description = "Allow SSH inbound traffic from a specific IP"
}