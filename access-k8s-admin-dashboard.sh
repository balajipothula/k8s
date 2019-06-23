# 
ssh -o ServerAliveInterval=60 -o ServerAliveCountMax=30 -o CheckHostIP=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i "vpc0-subnet0-ec2.pem" -L 8001:127.0.0.1:8001 ec2-user@13.233.9.48

# open below url in your local browser.
# http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login
