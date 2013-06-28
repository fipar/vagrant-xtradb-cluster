# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :pxc_node1 do |node1_config|
	node1_config.vm.box = 'centos6'
	node1_config.vm.box_url = 'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box' 
	node1_config.vm.hostname = 'node1'
	node1_config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "256", "--cpuexecutioncap", "60", "--name", "vagrant-pxc-node1"] 
	end
	node1_config.vm.network :private_network, ip: "192.168.70.2"
	node1_config.vm.provision :puppet do |node1_puppet|
		node1_puppet.options = '--verbose'
		node1_puppet.module_path= "modules"
	end
   end

  config.vm.define :pxc_node2 do |node2_config|
	node2_config.vm.box = 'centos6'
	node2_config.vm.box_url = 'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box' 
	node2_config.vm.hostname = 'node2'
	node2_config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "256", "--cpuexecutioncap", "60", "--name", "vagrant-pxc-node2"] 
	end
	node2_config.vm.network :private_network, ip: "192.168.70.3"
	node2_config.vm.provision :puppet do |node2_puppet|
		node2_puppet.options = '--verbose'
		node2_puppet.module_path= "modules"
	end
   end

  config.vm.define :pxc_node3 do |node3_config|
	node3_config.vm.box = 'centos6'
	node3_config.vm.box_url = 'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box' 
	node3_config.vm.hostname = 'node3'
	node3_config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "256", "--cpuexecutioncap", "60", "--name", "vagrant-pxc-node3"] 
	end
	node3_config.vm.network :private_network, ip: "192.168.70.4"
	node3_config.vm.provision :puppet do |node3_puppet|
		node3_puppet.options = '--verbose'
		node3_puppet.module_path= "modules"
	end
   end

end
