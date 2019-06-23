#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 21 June 2019,
# Description : Kubernetes Minion setup on RHEL7.

# setting hostname.
# hostnamectl set-hostname 'k8s-minion'

# executing bash.
# exec bash

# setting selinux in permissive mode.
setenforce 0

# not loading selinux policy. 
# no selinux policy is loaded.
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# installing firewall management tool. 
yum -y install firewalld

# starting firewalld service.
systemctl start firewalld

# enabling firewalld service auto-start at system boot.
systemctl enable firewalld

# opening a ports.
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd --permanent --add-port=30000-32767/tcp
firewall-cmd --permanent --add-port=6783/tcp

# reloading firewall.
firewall-cmd --reload

# adding br_netfilter module from kernel.
modprobe br_netfilter

# traverse iptables rules.
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

# disabling swap.
swapoff -a

# installing container-selinux-2.9
yum -y install http://vault.centos.org/centos/7.3.1611/extras/x86_64/Packages/container-selinux-2.9-4.el7.noarch.rpm

# installing docker-ce dependencies.
yum -y install yum-utils device-mapper-persistent-data lvm2

# adding docker repository.
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# installing docker-ce.
yum -y install docker-ce

# (re)starting docker.
systemctl restart docker
# run docker as daemon.
systemctl enable --now docker

# adding kubernetes repository.
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF

# installing kubernetes. 
yum -y install kubelet kubeadm kubectl --disableexcludes=kubernetes

# (re)starting kubelet.
systemctl  restart kubelet
# run kubelet as daemon.
systemctl enable --now kubelet
