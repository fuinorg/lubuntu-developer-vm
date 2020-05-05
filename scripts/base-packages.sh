#!/bin/bash -xe

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get dist-upgrade -y
apt-get install software-properties-common -y
apt-get install apt-transport-https -y

# Add Docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu eoan stable"
apt-get update -y
	
# Add Kubernetes repo
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update -y

# Standard packages
apt-get install -y galculator chromium-browser file-roller unzip git git-flow docker.io python3-pip snapd kubectl
snap install leafpad

# Docker Compose
COMPOSE_FILE=/usr/local/bin/docker-compose
COMPOSE_URL=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/docker/compose/releases/latest)
COMPOSE_DOWNLOAD_URL=${COMPOSE_URL/tag/download}/docker-compose-`uname -s`-`uname -m`
curl -L $COMPOSE_DOWNLOAD_URL -o $COMPOSE_FILE
chmod +x $COMPOSE_FILE

# MicroK8s
snap install microk8s --classic
chown root:developer /var/snap/microk8s/current/credentials/
chown root:developer /var/snap/microk8s/current/credentials/client.config
chown root:developer /var/snap/microk8s/current/args/
chown root:developer /var/snap/microk8s/current/args/kubectl

# SdkMan!
export SDKMAN_DIR="/home/developer/.sdkman" && curl -s "https://get.sdkman.io" | bash
chown -R developer:developer /home/developer/.sdkman
tee -a /home/developer/.bashrc <<< ''
tee -a /home/developer/.bashrc <<< '#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!'
tee -a /home/developer/.bashrc <<< 'export SDKMAN_DIR="/home/developer/.sdkman"'
tee -a /home/developer/.bashrc <<< '[[ -s "/home/developer/.sdkman/bin/sdkman-init.sh" ]] && source "/home/developer/.sdkman/bin/sdkman-init.sh"'
tee -a /home/developer/.profile <<< ''
tee -a /home/developer/.profile <<< '#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!'
tee -a /home/developer/.profile <<< 'export SDKMAN_DIR="/home/developer/.sdkman"'
tee -a /home/developer/.profile <<< '[[ -s "/home/developer/.sdkman/bin/sdkman-init.sh" ]] && source "/home/developer/.sdkman/bin/sdkman-init.sh"'

# AWS command line client
pip3 install awscli --upgrade
