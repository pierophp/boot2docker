#Boo2Docker persistir dados
sudo mkdir -p /mnt/sda1/home/docker/.docker
sudo mkdir  /mnt/sda1/home/docker/.ssh
sudo chown -R docker:docker  /mnt/sda1/home/docker
cp /home/docker/.docker/* /mnt/sda1/home/docker/.docker
cp /home/docker/.ssh/authorized_keys /mnt/sda1/home/docker/.ssh
cp /home/docker/.profile /mnt/sda1/home/docker/.profile

#adiciona script rsync
