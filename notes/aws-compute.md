## AMI - Amazom Machine Image
São imagens de sistemas operacionais na AWS. Elas contêm todas as informações necessárias para iniciarmos uma instância. Existem as criadas pela AWS, as pagas de terceiros e as da comunidade. Cada uma tem suas particularidades e deve ser analisada caso a caso para obter o melhor resultado para aquele determinado cenário.

Os principais sistemas operacionais Linux são openSUSE, Debian, Ubuntu, Red Hat e Amazon Linux, estando disponíveis também Windows e macOS.

O critério de escolha geralmente leva em conta se você vai utilizar os recursos da AWS (o Amazon Linux já vem com os pacotes da AWS instalados) ou se vai optar por uma abordagem diferente — como o Debian, prezando pela máxima estabilidade, ou o Red Hat, utilizando todo o ecossistema Red Hat em instâncias EC2.
## Launch Template
Aqui temos as configurações das instâncias EC2. Tudo relacionado a tipo de instância, discos, memória, CPU, perfil, _key pair_, entre outros, é configurado aqui. A definição da instância fica centralizada exclusivamente nesta etapa.

Não configuramos as questões de rede aqui, pois queremos fazer isso no Auto Scaling Group, seguindo as melhores práticas; afinal, criar instâncias isoladas é muito arriscado.
## Auto Scaling Group
Quando estamos falando sobre auto scaling group precisamos fazer uma separacao, precisamos seguir boas práticas, não é usual criar instancias separadas, para um melhor gerenciamento de performance, disponibilidade e custos, utilizamos do auto scaling group, através dele que vamos definir o nosso pool de instancias que vao rodar na aws, através de políticas de scaling definimos a quantidade de maquinas que queremos rodar, minimo, desejado e máximo, com base em métricas, sejam elas somente de cpu e memoria ou métricas personalizadas, tambem temos a politica de manutencao, é onde definimos o que vamos fazer com uma instancia com problemas, se vamos subir uma instancia antes de desregistrar a com problema, ou se vamos fazer o contrario, temos tambem as configuracoes de vpc que precisam ficar a nivel do pool, ou seja, no auto scaling group, aqui conseguimos definir por exemplo um balanceamento de instancias por regiao de disponibilidade, aqui estamos garantindo a alta disponibilidade do cluster.

-----
Criar keypair antes de tudo (provider TLS)
nao se configura credenciais dentro de instancias ec2, nem mesmo versionar isso no repositorio, utilize roles
para isso, precisamos de um instance profile que vai ter atrelado a ele uma unica role com a permissao devida, a instancia por sua vez atrelada ao instance profile.
Dessa maneira nao temos exposicao de secrets

Instance Role
A insancia recebe uma única role, essa role vai conter in-line-policies, permissões específicas para a instancia (ex: acessar um serviço de menssageria). 



