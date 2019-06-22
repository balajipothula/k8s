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

# getting node(s) information.
# kubectl get nodes

# getting pods namespaces information.
# kubectl get pods --all-namespaces

# installing kubernetes dashboard
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml

# running kubernetes-dashboard.
kubectl proxy --address 0.0.0.0 --port 8001 --accept-hosts '.*' &

# create a cluster admin service account.
kubectl create serviceaccount dashboard -n default

# adding cluster binding rules to dashboard account.
kubectl create clusterrolebinding dashboard-admin -n default --clusterrole=cluster-admin --serviceaccount=default:dashboard

# getting secret token for dashboard.
kubectl get secret $(kubectl get serviceaccount dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode

# 
ssh -i "vpc0-subnet0-ec2.pem" -L 8001:localhost:8001 ec2-user@ec2-13-233-216-205.ap-south-1.compute.amazonaws.com

# open below url in your local browser.
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/overview?namespace=default

# delete kubernetes-dashboard.
kubectl --namespace kube-system delete deployment kubernetes-dashboard
# or
kubectl delete -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml
