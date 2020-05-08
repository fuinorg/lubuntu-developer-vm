# lubuntu-developer-vm
Vagrant configuration for creating a developer Lubuntu VMware and VirtualBox image.

[![GPLv3 License](http://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

## Status
![Warning](https://raw.githubusercontent.com/fuinorg/lubuntu-developer-vm/master/warning.gif) **New 20.04 LTS is not yet finished as the Alternate ISO is no longer available from Lubuntu and we have to move to the Ubuntu "mini.iso"** ![Warning](https://raw.githubusercontent.com/fuinorg/lubuntu-developer-vm/master/warning.gif)

## Current versions
| Build | Branch | Status |
| :---- | :----- | :----- |
| [![Build Status 20.04-mini-amd64](https://jenkins.fuin.org/job/lubuntu-developer-vm-20.04-mini-amd64/badge/icon)](https://jenkins.fuin.org/job/lubuntu-developer-vm-20.04-mini-amd64/) | [Lubuntu 20.04 Mini AMD64](https://github.com/fuinorg/lubuntu-developer-vm/) \[**master**\] | Pre-built image available for [download](https://www.fuin.org/vm/) ![Warning](https://raw.githubusercontent.com/fuinorg/lubuntu-developer-vm/master/warning.gif) Work in progress - Has some issues! ![Warning](https://raw.githubusercontent.com/fuinorg/lubuntu-developer-vm/master/warning.gif) |
| [![Build Status 18.04-alternate-amd64](https://jenkins.fuin.org/job/lubuntu-developer-vm-18.04-alternate-amd64/badge/icon)](https://jenkins.fuin.org/job/lubuntu-developer-vm-18.04-alternate-amd64/) | [Lubuntu 18.04 Alternate AMD64](https://github.com/fuinorg/lubuntu-developer-vm/tree/lubuntu-18.04-alternate-amd64) | Pre-built image available for [download](https://www.fuin.org/vm/) | 

## Requirements for running the VM
* **Minimal:** Intel Core i5, 8 GB RAM, 128 GB SSD
* **Recommended:** Intel Core i7, 16 GB RAM, 256 GB SSD
* Enable [Virtualization](http://www.sysprobs.com/disable-enable-virtualization-technology-bios) in your BIOS
* Make sure to turn **OFF** Hyper-V for Windows 10
  * Click Windows 10 start button
  * Goto "Programs and Features"
  * Select "Turn Windows features on or off"
  * **Uncheck** the check box labeled as "Hyper-V"
* Install at least one of the following Hypervisors
  * [VMWare Workstation Player](https://www.vmware.com/products/workstation-player/workstation-player-evaluation.html) (>=14)
  * [Virtual Box](https://www.virtualbox.org/) (>=6.1)

## Download pre-built images
You can download the final **Lubuntu Developer VM (64 Bit)** image (Compressed ~2.3 GB / Uncompressed ~5.6 GB) here: 
* [fuin.org/vm](https://www.fuin.org/vm/) 
  * \*_vbx-\*.zip = VirtualBox
  * \*_vmw-\*.zip = VMware Workstation
  * Numbering scheme: \*-&lt;lubuntu-version&gt;-&lt;code-version&gt;-&lt;build-number&gt;
    * lubuntu_dev_vmw-17.10.1-0-34.zip = Lubuntu 17.10.1 / Code version 0 / Build 34
    * lubuntu_dev_vmw-18.4-0-6.zip = Lubuntu 18.04 / Code version 0 / Build 6

## Start virtual machine

Unpack and start the VM with VirtualBox or VMWare and login to the machine with:

* **User** ```developer```
* **Password** ```developer```

Be aware that there is also another (root) user 'vagrant' (password 'vagrant'). You can remove it safely with:
```
sudo userdel vagrant
sudo rm -r /home/vagrant 
```

*You should change the passwords on first login.*

## Packages and configuration 
* [Snap](https://wiki.ubuntuusers.de/snap/) (Software deployment and package management system)
* [Featherpad](https://manual.lubuntu.me/stable/2/2.4/2.4.2/Featherpad.html) (Text editor)
* [Galculator](http://galculator.mnim.org/) (Calculator)
* [Chromium](https://www.chromium.org/) (Browser)
* [SdkMan!](https://sdkman.io/) (Manage parallel versions of Java, Maven and other tools)
* [File Roller](https://wiki.gnome.org/Apps/FileRoller) (Archive Manager)
* [Unzip](https://packages.ubuntu.com/artful/unzip) (De-archiver for .zip files)
* [git](https://git-scm.com/) (VCS)
* [git-flow](https://packages.ubuntu.com/de/artful/git-flow) (See [Using git-flow to automate your git branching workflow](https://jeffkreeftmeijer.com/git-flow/))
* [Docker CE](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
* [Docker Compose](https://docs.docker.com/compose/)
* [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) (Kubernetes command line interface)
* [MicroK8s](https://microk8s.io/) (Zero-ops Kubernetes for workstations)
* [Python 2.7](https://www.python.org/download/releases/2.7/) and [pip](https://pip.pypa.io/)
* [AWS cli](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) (Amazon AWS Command Line Interface)
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

## Manual build
Execute the following commands in the root directory (where the 'Vagrantfile' is located).

To build a VirtualBox image:
```
vagrant up --provider virtualbox
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
See [Jenkinsfile](Jenkinsfile) for an example how to build this project with [Jenkins](https://jenkins.fuin.org/job/lubuntu-developer-vm-18.04-alternate-amd64/).

## Known Issues

### Build
If you want to create a Virtual Box **and** a VMware image, you need to create two different directories with the content of this repository. There is currently a limitation of Vagrant that does not allow to do this with the same configuration / same build.

### VMware VM
None

### Virtual Box VM
There are some issues with the virtual box VM that are not related to this project, but to VirtualBox itself.
* Display corrupted/garbled (See [Bug #1766859](https://bugs.launchpad.net/ubuntu/+source/lubuntu-meta/+bug/1766859))
  * Change to TTY (Ctrl+Alt F1) and back (Ctr+Alt F7) is a workaround the problem
  * Enable 3D acceleration for the VM
  * Enhance the video memory for the VM to 128 MB
  * Try changing the desktop resolution of the host OS (High resolutions bigger than 1920x1080 seem sometimes to cause the problem)
  * If all doesn't help: Use VMware Player with other VMware VM
* Change screen resolution fails (stuck at 1024x768). It's not really clear when/why this happens - Things you can try:
  * If the display is garbled (see above), most likely changing the screen resolution will also fail
  * Enable 3D acceleration for the VM
  * Change the video memory of the VM: Try different settings between 32 MB and 128 MB 
  * Try to toggle between full screen and non-full screen mode
  * Shutdown VM in full screen mode (next start will then be in full screen mode)
  * If all doesn't help: Use VMware Player with other VMware VM


## Credits
Many thanks to [Aaron](https://github.com/slapula/) who created this [Vagrant](https://www.vagrantup.com/) configuration.
You can hire him as a freelancer at [upwork.com](https://www.upwork.com/o/profiles/users/_~01d7141121116c4a6e/).

