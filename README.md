# lubuntu-developer-vm
Vagrant configuration for creating a developer Lubuntu VMware and VirtualBox image.

[![GPLv3 License](http://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

## Current versions
| Build | Branch | Status |
| :---- | :----- | :----- |
| [![Build Status 18.04-alternate-amd64](https://fuin-org.ci.cloudbees.com/job/lubuntu-developer-vm-18.04-alternate-amd64/badge/icon)](https://fuin-org.ci.cloudbees.com/job/lubuntu-developer-vm-18.04-alternate-amd64/) | [Lubuntu 18.04 Alternate AMD64](https://github.com/fuinorg/lubuntu-developer-vm/) \[**master**\] | Available for [download](https://fuinorg.jfrog.io/fuinorg/list/files/) |
| [![Build Status 17.10.1-alternate-amd64](https://fuin-org.ci.cloudbees.com/job/lubuntu-developer-vm-17.10.1-alternate-amd64/badge/icon)](https://fuin-org.ci.cloudbees.com/job/lubuntu-developer-vm-17.10.1-alternate-amd64/) | [Lubuntu 17.10.1 Alternate AMD64](https://github.com/fuinorg/lubuntu-developer-vm/tree/lubuntu-17.10.1-alternate-amd64) | Available for [download](https://fuinorg.jfrog.io/fuinorg/list/files/) | 

## Requirements
* **Minimal:** Intel Core i5, 8 GB RAM, 128 GB SSD
* **Recommended:** Intel Core i7, 16 GB RAM, 256 GB SSD
* Enable [Virtualization](http://www.sysprobs.com/disable-enable-virtualization-technology-bios) in your BIOS
* Make sure to turn **OFF** Hyper-V for Windows 10
  * Click Windows 10 start button
  * Goto "Programs and Features"
  * Select "Turn Windows features on or off"
  * **Uncheck** the check box labeled as "Hyper-V"

## Download
You can also download the final **Lubuntu Developer VM (64 Bit)** image (uncompressed ~3 GB) here: 
* [JFrog Artifactory](https://fuinorg.jfrog.io/fuinorg/list/files/) (~1.2 GB / 64 bit OS / vbx = VirtualBox / vmw = VMware Workstation)

Unpack and start the VM with VirtualBox or VMWare and login to the machine with:

* **User** ```developer```
* **Password** ```developer```

Be aware that there is also another (root) user 'vagrant' (password 'vagrant'). 

*You should change the passwords on first login.*

## Packages and configuration 
* [leafpad](https://wiki.ubuntuusers.de/Leafpad/) (Text editor)
* [galculator](http://galculator.mnim.org/) (Calculator)
* [Chromium](https://www.chromium.org/) (Browser)
* [Open JDK 8](http://openjdk.java.net/) (Java Development Kit)
* [Open JFX](http://openjdk.java.net/projects/openjfx/) (Java FX)
* [Apache Maven](https://maven.apache.org/) (Java Build Tool)
* [File Roller](https://wiki.gnome.org/Apps/FileRoller) (Archive Manager)
* [Unzip](https://packages.ubuntu.com/artful/unzip) (De-archiver for .zip files)
* [git](https://git-scm.com/) (VCS)
* [git-flow](https://packages.ubuntu.com/de/artful/git-flow) (See [Using git-flow to automate your git branching workflow](https://jeffkreeftmeijer.com/git-flow/))
* [Docker CE 1.13](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
* [Docker Compose 1.17](https://docs.docker.com/compose/)
* [Python 2.7](https://www.python.org/download/releases/2.7/) and [pip](https://pip.pypa.io/)
* [AWS cli 1.14](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) (Amazon AWS Command Line Interface)
* German keyboard

You can easily change this settings by editing the Vagrant file before building a new VM.

# Build
You can easily build the virtual machine on your local PC (bare metal).

## Prerequisites
Make sure that you have installed at least one of the following tools:
* [VirtualBox](https://www.virtualbox.org/)
* [VMware Workstation](http://store.vmware.com/store/vmwde/en_IE/DisplayProductDetailsPage/ThemeID.29219600/productID.5128762700) (Not free)

Also install:
* [Vagrant](https://www.vagrantup.com/)
* [vbguest plugin](https://github.com/dotless-de/vagrant-vbguest) (Only necessary for Virtual Box)
* [VMware provider](https://www.vagrantup.com/vmware) (Only necessary for VMware - NOT FREE) 

Checkout this repository or download and unzip the content to your hard disk.
You can easily adjust all shell scripts and settings to your needs.

CAUTION: If you want to create a Virtual Box **and** a VMware image, you need to create two different directories 
with the content of this repository. There is currently a limitation of Vagrant that does not allow to do this 
with the same configuration.  

## Manual build
Execute the following commands in the root directory (where the 'Vagrantfile' is located).

To build a VirtualBox image:
```
vagrant up
```

To build a VMware image (Requires [VMware provider](https://www.vagrantup.com/vmware)):
```
vagrant up --provider vmware_workstation
```

After the installation finished, shut down the image:  
```
vagrant halt
```

Start the new VM again with VirtualBox or VMWare and login to the machine with user 'developer' and password 'developer' (You should change the pw on first login).

## Automated Jenkins build
See [Jenkinsfile](Jenkinsfile) for an example how to build this project with [Jenkins](https://fuin-org.ci.cloudbees.com/job/lubuntu-developer-vm/).

## Credits
Many thanks to [Aaron](https://github.com/slapula/) who created this [Vagrant](https://www.vagrantup.com/) configuration.
You can hire him as a freelancer at [upwork.com](https://www.upwork.com/o/profiles/users/_~01d7141121116c4a6e/).

