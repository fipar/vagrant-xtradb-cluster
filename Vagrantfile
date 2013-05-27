# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :node1 do |node1_config|
	node1_config.vm.box = 'centos6'
	node1_config.vm.box_url = 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box'
	node1_config.vm.hostname = 'node1'
	node1_config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "256", "--cpuexecutioncap", "60"] 
	end
	node1_config.vm.network :private_network, ip: "192.168.70.2"
	node1_config.vm.provision :puppet do |node1_puppet|
		node1_puppet.options = '--verbose'
	end
   end

  config.vm.define :node2 do |node2_config|
	node2_config.vm.box = 'centos6'
	node2_config.vm.box_url = 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box'
	node2_config.vm.hostname = 'node2'
	node2_config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "256", "--cpuexecutioncap", "60"] 
	end
	node2_config.vm.network :private_network, ip: "192.168.70.3"
	node2_config.vm.provision :puppet do |node2_puppet|
		node2_puppet.options = '--verbose'
	end
   end

  config.vm.define :node3 do |node3_config|
	node3_config.vm.box = 'centos6'
	node3_config.vm.box_url = 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box'
	node3_config.vm.hostname = 'node3'
	node3_config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "256", "--cpuexecutioncap", "60"] 
	end
	node3_config.vm.network :private_network, ip: "192.168.70.4"
	node3_config.vm.provision :puppet do |node3_puppet|
		node3_puppet.options = '--verbose'
	end
   end

end
