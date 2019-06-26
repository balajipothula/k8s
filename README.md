# k8s setup on rhel machine.

===============================================================

step-1: sudo hostnamectl set-hostname 'k8s-master'

===============================================================

step-2: exec bash

===============================================================

step-3: sudo vi /etc/hosts (refer: k8s-master-hosts)

===============================================================

step-4: sudo ./setup-docker-redhat.sh  
        sudo usermod -a -G $USER  
        sudo reboot
        
===============================================================

step-5: sudo ./setup-k8s-master-redhat.sh

===============================================================

step-6: ./setup-k8s-kubectl-redhat.sh

===============================================================

step-7: ./setup-k8s-weave-net-redhat.sh

===============================================================

step-8: ./setup-k8s-admin-dashboard-redhat.sh

===============================================================

step-9: sudo hostnamectl set-hostname 'k8s-minion-0'

===============================================================

step-10:exec bash

===============================================================

step-11:sudo vi /etc/hosts (refer: k8s-minion-hosts)

===============================================================

step-12:sudo ./setup-docker-redhat.sh  
        sudo usermod -a -G $USER  
        sudo reboot
        
===============================================================
