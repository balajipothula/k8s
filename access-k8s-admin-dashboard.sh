#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 27 June 2019,
# Description : accessing k8s-admin-dashboard.

# open below url in your local browser.
# http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

readonly USR=ec2-user
readonly HOST=13.232.253.69
readonly LOCALHOST=127.0.0.1
readonly PORT=8001
readonly PEM=vpc0-subnet0-ec2.pem

# accessing k8s-admin-dashboard.
ssh -o ServerAliveInterval=60 -o ServerAliveCountMax=30 -o CheckHostIP=no -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i `pwd`/$PEM -L $PORT:$LOCALHOST:$PORT $USR@$HOST
