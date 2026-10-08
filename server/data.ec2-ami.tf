#Esse bloco aqui recuperamos uma AMI utilizando filtros, da AWS, é como se estivesse abrindo
#o painel de imagens e estivesse fazendo o filtro para selecionar qual usariamos.
#Então eu fiz esse processo, procurei manualmente com alguns filtros e to replicando aqui.
data "aws_ami" "this" {
  most_recent = true # pega a AMI mais recente do owner definido aqui em baixo.
  owners      = ["903794441882"]


  filter {
    name   = "name"
    values = ["debian-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}