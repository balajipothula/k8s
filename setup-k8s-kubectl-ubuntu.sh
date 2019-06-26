#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 26 June 2019,
# Description : Installing kubeclt on Ubuntu.

# Note: Please run this script with sudo privilage.

# updating packages index
apt update

# installing packages to allow apt to use repository over https.
apt install -y apt-transport-https

# adding kubernetes official gpg key.
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# setting up the stable kubernetes repository.
echo "deb https://apt.kubernetes.io/ kubernetes-$(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/kubernetes.list

# updating packages index
apt update

# installing kubectl.
apt install -y kubectl

# 
# multipass exec build-service -- /snap/bin/microk8s.config > $HOME/.kube/config
