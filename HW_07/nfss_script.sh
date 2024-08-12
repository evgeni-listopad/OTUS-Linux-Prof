#!/bin/bash

sudo yum install -y nfs-utils
sudo systemctl enable --now nfs-server

sudo mkdir -p /srv/share/upload
sudo chown -R nfsnobody:nfsnobody /srv/share
sudo chmod 0777 /srv/share/upload

sudo sh -c "echo '/srv/share 192.168.50.11/32(rw,sync,root_squash)' > /etc/exports"

sudo exportfs -a

sudo systemctl enable --now firewalld.service
sudo firewall-cmd --permanent --add-service=nfs
sudo firewall-cmd --permanent --add-service=rpc-bind
sudo firewall-cmd --permanent --add-service=mountd
sudo firewall-cmd --permanent --add-port=111/udp
sudo firewall-cmd --permanent --add-port=2049/udp
sudo firewall-cmd --permanent --add-port=20048/udp
sudo firewall-cmd --reload

sudo reboot
