# Criando a tabela de rotas para as subnets publicas,
# onde é definido a rota para o gateway de internet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    #Rota padrão para a internet, através do Internet Gateway.
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = { Name = "${var.vpc.name}-${var.vpc.public_route_table_name}" }
}
# Criando a associação da tabela de rotas com as subnets publicas,
# para que elas tenham acesso a internet atraves do gateway de internet
resource "aws_route_table_association" "a" {
  # count -> quantas vezes esse bloco vai repetir.
  count          = length(var.vpc.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}