# k8s setup on rhel machine.

===============================================================

step-1: $ hostnamectl set-hostname 'k8s-master' (set hostname)

===============================================================

step-2: $ exec bash (execute bash)

===============================================================

step-3: edit /etc/hosts (refer: k8s-master-hosts)

===============================================================

step-4: run setup-docker-redhat.sh as sudoer

===============================================================

step-5: run setup-k8s-master-redhat.sh as sudoer

===============================================================

step-6: run setup-k8s-kubectl-redhat.sh as non-sudoer

===============================================================

step-7: run setup-k8s-admin-dashboard-redhat.sh as non-sudoer

===============================================================
