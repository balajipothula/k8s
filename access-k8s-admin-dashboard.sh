# 
ssh -i "vpc0-subnet0-ec2.pem" -L 8001:127.0.0.1:8001 ec2-user@52.66.23.188

# open below url in your local browser.
# http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login
