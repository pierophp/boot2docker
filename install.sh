
read -p "Qual seu usuário da máquina host?" user

#Boo2Docker persistir dados
echo "Montando /home/docker"
sudo mkdir -p /mnt/sda1/home/docker/.docker
sudo mkdir  /mnt/sda1/home/docker/.ssh
cp /home/docker/.docker/* /mnt/sda1/home/docker/.docker
cp /home/docker/.ssh/authorized_keys /mnt/sda1/home/docker/.ssh
cp /home/docker/.profile /mnt/sda1/home/docker/.profile

#Gravando usuário Windows
echo $user > /mnt/sda1/home/docker/user_host
test -d /c/Users && ln -s /c/Users /Users
mkdir /Users/$user/docker_bkp

# Apaga o conteúdo antigo da VM
rm -Rf /home/docker

# Deixa a /home na partição física para não perder os dados
ln -s  /mnt/sda1/home/docker /home/docker

#Docker Compose
echo "Instalando Docker Compose"
sudo mkdir /mnt/sda1/bin
wget https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` -O /home/docker/docker-compose
sudo mv /home/docker/docker-compose /mnt/sda1/bin/docker-compose
sudo chmod +x /mnt/sda1/bin/docker-compose

#baixa o script
echo "Baixando bootlocal.sh"
wget https://raw.githubusercontent.com/pierophp/boot2docker/master/templates/bootlocal.sh -O /home/docker/bootlocal.sh
mv /home/docker/bootlocal.sh /var/lib/boot2docker/bootlocal.sh
chmod +x /var/lib/boot2docker/bootlocal.sh

#RSYNC Script
echo "Baixando rsync.sh"
wget https://raw.githubusercontent.com/pierophp/boot2docker/master/templates/rsync.sh -O /home/docker/rsync.sh
chmod +x /home/docker/rsync.sh

echo "Mudando proprietário da home"
chown -R docker:docker /mnt/sda1/home/docker

#Download Crontab
echo "Download crontab"
wget https://raw.githubusercontent.com/pierophp/boot2docker/master/templates/crontab_docker -O /home/docker/crontab_docker

echo "Baixando o container samba"
docker pull dperson/samba

echo "Baixando o container rsync"
docker pull bfosberry/rsync

echo "Reiniciando"
reboot
