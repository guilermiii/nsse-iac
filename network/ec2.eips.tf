# Esse arquivo é responsável por criar os Elastic IPs (EIPs) para os NAT Gateways. Cada NAT Gateway precisa de um EIP associado para funcionar corretamente.
resource "aws_eip" "this" {
  # count não é a melhor prática de uso pois usa index, o ideal seria for_each,
  # no futuro quando aprender, volto aqui pra refatorar usando for_each.
  count  = length(aws_subnet.public)
  domain = "vpc"
  tags   = { Name = "${var.vpc.name}-${var.vpc.eip_nat_gateway_name}-${var.vpc.public_subnets[count.index].availability_zone}" }
}