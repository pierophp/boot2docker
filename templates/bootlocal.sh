# Apaga o conteúdo antigo da VM
rm -Rf /home/docker
# Deixa a /home na partição física para não perder os dados
ln -s  /mnt/sda1/home/docker /home/docker

# Referencia o docker-compose
ln -s /mnt/sda1/bin/docker-compose /usr/bin/docker-compose

# Configura o IP manualmente
ifconfig eth1 192.168.99.2

echo "*/10 * * * * /bin/sh -c '/home/docker/rsync.sh >> /var/log/rsync'" >> /var/spool/cron/crontabs/docker

# Inicia Cron
/etc/init.d/services/crond start