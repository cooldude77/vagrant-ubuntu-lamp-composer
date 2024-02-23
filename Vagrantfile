Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"

  # Give our VM a name so we immediately know which box this is when opening VirtualBox, and spice up our VM's resources
    config.vm.provider "virtualbox" do |v|
        v.name = "My Cool Test box"
        v.memory = 4096
        v.cpus = 1
    end
    # Choose a custom IP so this doesn't collide with other Vagrant boxes
    config.vm.network "private_network", ip: "192.168.88.188"
	
	config.vm.synced_folder ".", "/var/www", mount_options: ["dmode=777,fmode=666"]
    
	 # Execute shell script(s)
	config.vm.provision :shell, path: "provision/components/start.sh"
    config.vm.provision :shell, path: "provision/components/apache.sh"
	config.vm.provision :shell, path: "provision/components/php.sh"	
	config.vm.provision :shell, path: "provision/components/mysql.sh"
	config.vm.provision :shell, path: "provision/components/composer.sh"
end
