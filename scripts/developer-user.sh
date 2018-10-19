#!/bin/bash -xe

adduser --quiet --disabled-password --shell /bin/bash --home /home/developer --gecos "Developer" developer
echo "developer:developer" | chpasswd
sudo adduser developer sudo
sudo groupadd docker
sudo usermod -aG docker developer
