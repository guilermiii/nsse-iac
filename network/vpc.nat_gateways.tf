#Criando os NAT Gateways.
resource "aws_nat_gateway" "this" {
  # count -> quantas vezes esse bloco vai repetir com base no número de subnets públicas. 
  count = length(var.vpc.public_subnets)

  # Alocando um IP Publico - Elastic IP (EIP) para cada NAT Gateway.
  allocation_id = aws_eip.this[count.index].id

  # Associando o NAT Gateway a uma subnet pública específica, garantindo que ele tenha acesso à internet.
  subnet_id = aws_subnet.public[count.index].id

  tags = { Name = "${var.vpc.name}-${var.vpc.eip_nat_gateway_name}-${var.vpc.public_subnets[count.index].availability_zone}" }

  # Precisa dessa declaração de dependência explicita, ta na documentação do provider.
  # Aqui precisamos garantir que o Internet Gateway seja criado antes do NAT Gateway.
  # O Nat Gateway precisa do Internet Gateway para funcionar.
  depends_on = [aws_internet_gateway.this]
}