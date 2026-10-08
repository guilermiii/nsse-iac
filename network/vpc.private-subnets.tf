resource "aws_subnet" "private" {

  # count -> Quantas vezes esse bloco vai repetir criando as subnets privadas.
  count = length(var.vpc.private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.vpc.private_subnets[count.index].cidr_block
  availability_zone = var.vpc.private_subnets[count.index].availability_zone

  tags = { Name = "${var.vpc.name}-${var.vpc.private_subnets[count.index].name}" }
}