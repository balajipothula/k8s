#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 26 June 2019,
# Description : Installing STATIC kubeclt BIN on Linux.

# downloading latest kubectl
curl -Lo kubectl "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

# changing kubectl to executable mode.
chmod +x kubectl

# moving kubectl to bin.
sudo mv kubectl /usr/local/bin
