#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 22 June 2019,
# Description : Docker setup on RHEL7.

# installing docker required packages.
yum install yum-utils device-mapper-persistent-data lvm2

# adding docker repository.
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# installing docker-ce.
yum update && yum install docker-ce-18.06.2.ce

# creating /etc/docker directory.
mkdir /etc/docker

# setting-up docker daemon.
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF

# creating docker daemon directory.
mkdir -p /etc/systemd/system/docker.service.d

# restarting docker.
systemctl daemon-reload
systemctl restart docker
