# lubuntu-developer-vm
Vagrant configuration for creating a developer Lubuntu VMware and VirtualBox image.

By default configured for German keyboard (See Vagrant file to change this).

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

## Build
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

## Credits
Many thanks to [Aaron](https://github.com/slapula/) who created this [Vagrant](https://www.vagrantup.com/) configuration.
You can hire him as a freelancer at [upwork.com](https://www.upwork.com/o/profiles/users/_~01d7141121116c4a6e/).

