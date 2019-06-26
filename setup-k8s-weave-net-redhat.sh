#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 20 June 2019,
# Description : Kubernetes kube setup on RHEL7.

# Please run this script with non root user (with out sudo)

# exporting kubectl version
export kubever=$(kubectl version | base64 | tr -d '\n')

# setting up coredns(dns servers).
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
