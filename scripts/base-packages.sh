#!/bin/bash -xe

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get dist-upgrade -y
apt-get install software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get install -y leafpad galculator chromium-browser openjdk-8-jdk openjfx maven file-roller unzip git git-flow docker.io python-pip
update-java-alternatives --set java-1.8.0-openjdk-amd6

COMPOSE_FILE=/usr/local/bin/docker-compose
COMPOSE_URL=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/docker/compose/releases/latest)
curl -L $COMPOSE_URL/docker-compose-`uname -s`-`uname -m` -o $COMPOSE_FILE
chmod +x $COMPOSE_FILE

pip install awscli --upgrade
