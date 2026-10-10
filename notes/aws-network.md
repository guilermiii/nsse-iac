CIDR - Classless Interdomain Routing


VPC - Virtual Private Cloud

az - zonas de disponibilidades (se trata de um datacenter separado geofraficamente)
multi az - voce define diferentes redes em diferentes regioes geofráficas dentro de uma mesma região na aws (zonas de disponibilidade dentro de uma mesma regiao) trazendo mais disponibilidade.

nat gateway ---> esse cara geralmente é um por zona de disponibilidade, ele é usado para que saia trafego de fora pra dentro, ex instalar uma aplicação, fazer uma atualização, aplicar um path no banco, ele não recebe trafégo inbound (INGRESS).
pra isso precisamos que a instancia ec2 tenha uma rota para o nat gateway, e nele, configuramos um ip publico e uma rota para 0.0.0.0/0 apontando para o internet gateway.
Isso é uma boa prática, dar ip publico direto pra uma instancia deixa ela mais exposta, o nat-gateway atua como um nat mesmo kkkkkkk, é igual a você na sua casa com seu ip privado, o pacote chega no roteador e o roteador leva ele pra internet e te devolve, mesmo sentido.

check-list do que é feito:
alocar a uma subnet publica
1 por zona de disponibilidade (pode ser um pra todas, chamado de cross-only, economiza, se for app pequeno compensa pro cliente)
alocar uma subnet privada (mesma das instancias)
tabela de roteamento privado
ip publico
apontar para o internet gateway
nat gateway a depender do caso de uso.

internet gateway ---> recebe o trafego nao solicitado e encaminha pra instancia atras dele, ele faz o oposto que o nat gateway, atuando apenas como um roteador de borda, sem inspecionar pacotes, é apenas a ponte da VPC com o mundo.

O que difere uma subnet privada de uma publica é só a presença do internet gateway.
