#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 26 June 2019,
# Description : Installing kubeclt on Ubuntu.

# 

# 
apt update && apt install -y apt-transport-https

#
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

#
echo "deb https://apt.kubernetes.io/ kubernetes-$(lsb_release --codename | cut -f2) main" | tee -a /etc/apt/sources.list.d/kubernetes.list

#
apt update && apt install -y kubectl

#
# multipass exec build-service -- /snap/bin/microk8s.config > $HOME/.kube/config
