terraform {
  required_version = "> 1.11.0"
  backend "s3" {
    bucket       = "nsse-tf-state-files-guilermiiii" # Valores devem ser fixos, sem variavel
    key          = "prod/main.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # Novo state locking nativo do S3
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Define o backend remoto do terraform, onde o estado do terraform será armazenado
provider "aws" {
  region = var.region

  default_tags {
    tags = var.tags
  }
  assume_role {
    role_arn    = var.assume_role.arn
    external_id = var.assume_role.external_id
  }
}