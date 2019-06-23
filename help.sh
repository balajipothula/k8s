# removing weave net data db.
sudo rm -rf /var/lib/weave/weave-netdata.db
# removing weave pods.
for i in $(kubectl get pods -n kube-system | awk '{print $1}' | grep weave); do kubectl delete pod -n kube-system $i; done
