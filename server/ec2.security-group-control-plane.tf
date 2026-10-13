resource "aws_security_group" "control_plane" {
  name        = var.ec2_resources.control_plane_security_group
  description = "Managing ports for control-plane nodes"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  tags = merge(var.tags, { Name = var.ec2_resources.control_plane_security_group })
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4-control-plane" {
  security_group_id = aws_security_group.control_plane.id
  cidr_ipv4         = "0.0.0.0/0" 
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6-control-plane" {
  security_group_id = aws_security_group.control_plane.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}