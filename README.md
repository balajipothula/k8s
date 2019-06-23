# k8s setup on rhel machine.

===============================================================

step-1: set hostname.

$ hostnamectl set-hostname 'k8s-master'

===============================================================

step-2: execute bash.

$ exec bash

===============================================================

step-3: edit /etc/hosts

refer: k8s-master-hosts file.

===============================================================

step-4: run setup-docker-redhat.sh with sudo privilege

refer: setup-docker-redhat.sh file.

===============================================================

step-5: run setup-k8s-master-redhat.sh with sudo privilege

refer: setup-k8s-master-redhat.sh file.

===============================================================

step-6: run setup-k8s-kubectl-redhat.sh with out sudo privilege

refer: setup-k8s-kubectl-redhat.sh

===============================================================


