resource "aws_security_group" "worker" {
  name        = var.ec2_resources.worker_security_group
  description = "Managing ports for worker nodes"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  tags = merge(var.tags, { Name = var.ec2_resources.worker_security_group })
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4-worker" {
  security_group_id = aws_security_group.worker.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6-worker" {
  security_group_id = aws_security_group.worker.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}