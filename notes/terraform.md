Criando um remote backend na aws (legado)
criar um bucket s3 para o terraform state -> criar uma tabela no mongo db para usar como state locking.

(Boa prática) Separar os recursos em arquivos terraform, com um arquivo variables.tf para declarar variáveis, pode ser colocado um valor default, para variavéis que não representam insegurança, para tudo que não pode ficar exposto, podemos ter um arquivo terraform.tfvars que será ignorado pelo git, em uma esteira de CI CD isso estará em vaults e secrets(GitHub)

apos isso configurar a networking começando pela vpc - posteriormente escolher se vai continuar pela public subnet ou private subnet
nesse curso começou pela public subnet
então a ordem foi:

VPC -> Internet Gateway -> Subnets publicas  -> tabela de roteamento publica
ou VPC -> Nat Gateway - Subnets privadas -> tabelas de roteamento privadas

na hora de criar a parte de computação, primeiramente criar com o provider TLS as keypars para utilizar e acessar, caso vá utilizar desta abordagem.
