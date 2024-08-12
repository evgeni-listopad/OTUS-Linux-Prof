#!/bin/bash

sudo yum install -y nfs-utils

sudo mkdir -p /mnt/nfs_share

sudo sh -c 'echo "192.168.50.10:/srv/share/upload /mnt/nfs_share nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab'

sudo reboot
