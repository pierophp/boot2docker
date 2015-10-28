#Boo2Docker persistir dados
sudo mkdir -p /mnt/sda1/home/docker/.docker
sudo mkdir  /mnt/sda1/home/docker/.ssh
sudo chown -R docker:docker  /mnt/sda1/home/docker
cp /home/docker/.docker/* /mnt/sda1/home/docker/.docker
cp /home/docker/.ssh/authorized_keys /mnt/sda1/home/docker/.ssh
cp /home/docker/.profile /mnt/sda1/home/docker/.profile

#Docker Compose
sudo mkdir /mnt/sda1/bin
wget https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m`
sudo mv docker-compose-Linux-x86_64 /mnt/sda1/bin/docker-compose
sudo chmod +x /mnt/sda1/bin/docker-compose

#baixa o script
wget https://raw.githubusercontent.com/pierophp/boot2docker/master/templates/bootlocal.sh -O /home/docker/bootlocal.sh
rm /var/lib/boot2docker/bootlocal.sh
mv bootlocal.sh /var/lib/boot2docker/bootlocal.sh
chmod +x /var/lib/boot2docker/bootlocal.sh

#RSYNC Script
wget https://raw.githubusercontent.com/pierophp/boot2docker/master/templates/rsync.sh -O /home/docker/rsync.sh

#Download Crontab
wget https://raw.githubusercontent.com/pierophp/boot2docker/master/templates/crontab_docker -O /home/docker/crontab_docker
