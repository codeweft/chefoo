# -*- mode: ruby -*-
# vi: set ft=ruby :

#Install following and do VagrantUp
#http://www.vagrantup.com/
#https://www.virtualbox.org/wiki/Downloads

Vagrant.configure("2") do |config|
  config.vm.box = "chefoo"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :forwarded_port, guest: 80, host: 9881
  config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network
  config.vm.synced_folder ".", "/source"
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :shell do |shell|
    shell.inline = "sh /source/provision.sh"
  end
  # http://workstuff.tumblr.com/post/50911984233/some-tips-on-getting-started-with-vagrant-and-chef
  #config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "cookbooks"
  #   chef.roles_path = "roles"
  #   #chef.data_bags_path = "data_bags"
  #   chef.add_recipe "apt"
  #   chef.add_recipe "deploy"
  #   chef.add_recipe "configure"
  #   chef.add_role "web"
  #   chef.json = { :ngnix_port => "80" }
  #end
end
