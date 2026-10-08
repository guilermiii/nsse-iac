# Saida dos recursos criados, para facilitar a integração com outros módulos ou para referência futura
output "vpc_id" {
  value       = aws_vpc.this.id
  description = "ID of the created VPC"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.this.id
  description = "ID of the created Internet Gateway"
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "IDs of the created public subnets"
}

output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
  description = "IDs of the created private subnets"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "ID of the created public route table"
}
output "private_route_table_ids" {
  value       = aws_route_table.private[*].id
  description = "IDs of the created private route tables"
}