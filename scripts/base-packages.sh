#!/bin/bash -xe

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get dist-upgrade -y
apt-get install software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get install -y leafpad galculator chromium-browser openjdk-8-jdk openjfx file-roller unzip git gksu docker.io python-pip

curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

pip install awscli --upgrade
