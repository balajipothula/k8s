#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 22 June 2019,
# Description : Docker setup on RHEL7.

# installing docker required packages.
yum -y install yum-utils device-mapper-persistent-data lvm2

# installing container-selinux-2.9
# docker-ce-18 requires container-selinux >= 2.9
yum -y install http://vault.centos.org/centos/7.3.1611/extras/x86_64/Packages/container-selinux-2.9-4.el7.noarch.rpm

# adding docker repository.
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# installing docker-ce.
yum -y update && yum -y install docker-ce-18.06.2.ce

# creating /etc/docker directory.
mkdir /etc/docker

# setting-up docker daemon.
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": { "max-size": "100m" },
  "storage-driver": "overlay2",
  "storage-opts": ["overlay2.override_kernel_check=true"]
}
EOF

# creating docker daemon directory.
mkdir -p /etc/systemd/system/docker.service.d

# reloading system daemons.
systemctl daemon-reload

# (re)starting docker.
systemctl restart docker
# run docker as daemon.
systemctl enable --now docker

# adding current user (non root user) to docker group.
# note: reboot required.
# sudo usermod -a -G docker $USER
