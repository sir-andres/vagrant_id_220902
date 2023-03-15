# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "mpasternak/focal64-arm"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder "./data", "/vagrant_data"

  config.vm.provision "shell", path: "install_runner_and_registration.sh"

  config.vm.provision "shell", path: "install_docker.sh" #inline: <<-SHELL
  
  config.vm.provision 'gitlab', type: 'shell', path: 'gitlab-runner-docker.sh'
end
