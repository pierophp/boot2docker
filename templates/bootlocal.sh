# Apaga o conteúdo antigo da VM
rm -Rf /home/docker
# Deixa a /home na partição física para não perder os dados
ln -s  /mnt/sda1/home/docker /home/docker

# Referencia o docker-compose
ln -s /mnt/sda1/bin/docker-compose /usr/bin/docker-compose

user=`cat /home/docker/user_host`

#Link simólico para backup
ln -s /Users/$user/docker_bkp /docker_bkp

# Configura o IP manualmente
ifconfig eth1 192.168.99.2

# Start Cron
cp /home/docker/crontab_docker /var/spool/cron/crontabs/docker

# Inicia Cron
/etc/init.d/services/crond start
