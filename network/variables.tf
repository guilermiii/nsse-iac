# Arquivo de variaveis
variable "region" {
  type        = string
  description = "regiao da aws"
}

variable "tags" {
  type = map(string)
}

variable "assume_role" {
  type = object({
    arn         = string
    external_id = string
  })
}

variable "vpc" {
  description = "Configurações para a VPC e seus componentes relacionados"
  type = object({
    cidr_block               = string
    name                     = string
    internet_gateway_name    = string
    public_route_table_name  = string
    eip_nat_gateway_name     = string
    private_route_table_name = string
    # Acredito que aqui será impactado quando usar for_each
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })
}

