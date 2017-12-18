#!/bin/bash -xe

adduser --quiet --disabled-password --shell /bin/bash --home /home/developer --gecos "Developer" developer
echo "developer:developer" | chpasswd
