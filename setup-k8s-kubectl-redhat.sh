#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 20 June 2019,
# Description : Kubernetes kube setup on RHEL7.

# Please run this script with non root user (with out sudo)

# creating .kube directory for current user (non root user)
mkdir -p $HOME/.kube

# copying kubernetes admin.conf to
# current user's .kube directory with name config.
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

# changing ownership of config file to current user.
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# exporting kubectl version
export kubever=$(kubectl version | base64 | tr -d '\n')

# setting up coredns(dns servers).
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
