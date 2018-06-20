Vagrant.configure("2") do |config|

  # See https://github.com/fuinorg/lubuntu-vagrant-base-box  
  config.vm.box = "fuin/lubuntu-17.10-alternate-amd64"
  config.vm.box_version = "0.1.7" 

  # Install developer user
  config.vm.provision :shell, path: "scripts/developer-user.sh"
  
  # Install base packages
  config.vm.provision :shell, path: "scripts/base-packages.sh"

  # Set German language and keyboard  
  ENV['LC_ALL']="de_DE.UTF-8"
  config.vm.provision :shell, inline: "localectl set-keymap de"

  # VirtualBox settings
  config.vm.provider "virtualbox" do |vb|
  
    vb.linked_clone = false
	vb.gui = false
    vb.memory = 4096
    vb.cpus = 2
    vb.name = "lubuntu_dev_vbx"
	
    #Simulate connected network cable
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
	
    #Enable shared clipboard
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
	
    #Enable drag-n-drop
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
	
  end

  # VMware settings
  config.vm.provider "vmware_workstation" do |vmw|
  
    vmw.linked_clone = false
    vmw.gui = false
    vmw.memory = 4096
    vmw.cpus = 2
    vmw.vmx["ethernet0.pcislotnumber"] = "33"
    vmw.vmx['displayname'] = 'lubuntu_dev_vmw'

    # Enable full DND
    vmw.vmx["isolation.tools.dnd.disable"] = "FALSE"
    vmw.vmx["isolation.tools.copy.disable"] = "FALSE"
    vmw.vmx["isolation.tools.paste.disable"] = "FALSE"

  end
  
end
