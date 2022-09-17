#!/bin/bash

#удаляем старые версии
sudo apt-get remove -y docker docker-engine docker.io containerd runc

#настроим репозиторий
sudo apt-get update

sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

 #установка docker
 sudo apt-get update
 sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

 #проверка установки
 sudo service docker start

#создать группу docker to use docker without sudo
sudo groupadd docker
sudo usermod -aG docker vagrant
#activate changes to groups
newgrp docker
 