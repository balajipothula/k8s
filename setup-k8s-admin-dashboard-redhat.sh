#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 20 June 2019,
# Description : Kubernetes kube setup on RHEL7.

# Please run this script as non root user (with out sudo)

# installing kubernetes dashboard
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml

# running kubernetes-dashboard.
kubectl proxy --address 0.0.0.0 --port 8001 --accept-hosts '.*' &

# creating a cluster admin service account.
kubectl create serviceaccount dashboard -n default

# adding cluster binding rules to dashboard account.
kubectl create clusterrolebinding dashboard-admin -n default --clusterrole=cluster-admin --serviceaccount=default:dashboard

# getting secret token for dashboard.
kubectl get secret $(kubectl get serviceaccount dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode

# just new line.
echo -e '\n'
