Vagrant.configure("2") do |config|

  # See https://github.com/fuinorg/lubuntu-vagrant-base-box  
  config.vm.box = "fuin/lubuntu-17.10-alternate-amd64"

  # Install developer user
  config.vm.provision :shell, path: "scripts/developer-user.sh"
  
  # Install base packages
  config.vm.provision :shell, path: "scripts/base-packages.sh"

  # Set German language and keyboard  
  ENV['LC_ALL']="de_DE.UTF-8"
  config.vm.provision :shell, inline: "localectl set-keymap de"

  # VirtualBox settings
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = 4096
    vb.cpus = 2
  end

  # VMware settings
  config.vm.provider "vmware_workstation" do |vmw|
    vmw.gui = true
    vmw.memory = 4096
    vmw.cpus = 2
    vmw.vmx["ethernet0.pcislotnumber"] = "33"
  end
  
end
