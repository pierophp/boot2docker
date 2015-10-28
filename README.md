# Docker no Windows

## Introdução
Para rodar o docker no Windows com performance, o segredo é deixar os arquivos dentro do Virtual Box.

Para acessar seus arquivos, é utilizado um compartilhamento samba.

Como existe a possibilidade da sua VM corromper, é feito um backup da sua /home/docker a cada 10 minutos na sua pasta pessoal no Windows na pasta "docker_bkp".

Nesse script também é instalado o docker-compose que não vem instalado por padrão no boot2docker para Windows.

Além disso, por padrão o /home/docker é perdido a cada reboot, esse script também corrigi isso.

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

## Adicionar hostname

Abra o arquivo como administrador:
```
C:\Windows\System32\Drivers\etc\hosts
```

Adicione seus hosts:
```
192.168.99.2 docker.dev
```
## Acessando seus arquivos

Abra um CMD e monte o caminho remoto:
```
net use Z: \\192.168.99.2\docker
```
