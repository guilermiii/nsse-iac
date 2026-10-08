# Criando a tabela de rotas para as subnets publicas,
# onde é definido a rota para o gateway de internet.
resource "aws_route_table" "private" {
  count  = length(aws_subnet.private)
  vpc_id = aws_vpc.this.id

  route {
    #Rota padrão para a internet, através do NAT Gateway.
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this[count.index].id
  }

  tags = { Name = "${var.vpc.name}-${var.vpc.private_route_table_name}-${aws_subnet.private[count.index].availability_zone}" }
}
# Criando a associação da tabela de rotas com as subnets privadas,
# para que elas tenham acesso a internet atraves do NAT Gateway.
resource "aws_route_table_association" "private" {
  # count -> quantas vezes esse bloco vai repetir.
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}