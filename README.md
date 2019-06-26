# k8s setup on rhel machine.

step-01: sudo vi /etc/hosts    (refer: k8s-master-hosts)  
step-02: sudo vi /etc/hostname (k8s-master)  
step-03: sudo ./setup-docker-redhat.sh  
setp-04: sudo usermod -a -G $USER  
setp-05: sudo reboot  
step-06: sudo ./setup-k8s-master-redhat.sh  
step-07: ./setup-k8s-kubectl-redhat.sh  
step-08: ./setup-k8s-weave-net-redhat.sh  
step-09: ./setup-k8s-admin-dashboard-redhat.sh  
step-10: sudo vi /etc/hosts    (refer: k8s-minion-hosts)  
step-11: sudo vi /etc/hostname (k8s-minion)  
step-12: sudo ./setup-docker-redhat.sh  
step-13: sudo usermod -a -G $USER  
step-14: sudo reboot
step-15: sudo ./setup-k8s-minion-redhat.sh
