#!/bin/bash


sudo fdisk /dev/sdf <<EOF
n
p
1


+1G
w
EOF

sudo pvcreate /dev/sdf1

sudo vgextend vg_datos /dev/sdf1

sudo lvextend -L +512M /dev/vg_datos/lv_docker

sudo resize2fs /dev/vg_datos/lv_docker

df -h /var/lib/docker

