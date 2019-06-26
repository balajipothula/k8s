# k8s setup on rhel machine.

===============================================================

step-1: sudo hostnamectl set-hostname 'k8s-master' (set hostname)

===============================================================

step-2: exec bash (execute bash)

===============================================================

step-3: sudo vi /etc/hosts (refer: k8s-master-hosts)

===============================================================

step-4: sudo ./setup-docker-redhat.sh

===============================================================

step-5: sudo ./setup-k8s-master-redhat.sh

===============================================================

step-6: sudo ./setup-k8s-kubectl-redhat.sh

===============================================================

step-7: sudo ./setup-k8s-admin-dashboard-redhat.sh

===============================================================
