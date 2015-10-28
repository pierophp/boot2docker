# Docker no Windows

## Instalação

Instale:
* [Docker Toolbox](https://www.docker.com/toolbox)

## Alteração da porta SSH
O Docker Toolbox, deixa o redirecionamento da porta SSH do NAT numa porta alta, altere para 2222

## Alias para acessar boot2docker

Abra o Git Bash e adicione isso ao arquivo ~/.bash_profile

```
alias dssh='ssh -i ~/.docker/machine/machines/default/id_rsa -p 2222 docker@127.0.0.1'
```

## Configurando seu boot2docker
Execute esse comando dentro do boot2docker (irá pedir seu usuário do Windows):
```
sudo wget https://raw.githubusercontent.com/pierophp/boot2docker/master/install.sh -O /install.sh
sudo chmod +x /install.sh
sudo /install.sh
```

## Gerar chave SSH
Gere uma chave SSH e cole no GitHub
```
ssh-keygen -t rsa -b 4096 -C "user@email.com"
cat ~/.ssh/id_rsa.pub
```

# Adicionar hostname

Abra o arquivo como administrador:
```
C:\Windows\System32\Drivers\etc\hosts
```

Adicione:
```
192.168.99.2 docker.dev
```
# Acessando seus arquivoss

Abra um CMD e monte o caminho remoto:
```
net use Z: \\192.168.99.2\docker
```
