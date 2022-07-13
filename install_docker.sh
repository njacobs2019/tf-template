!#/bin/bash

echo "*************************"
echo "Uninstalling old versions"
echo "*************************"

sudo apt-get remove docker docker-engine docker.io containerd runc


echo "*************************"
echo "Setting up the repository"
echo "*************************"
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


echo "*****************"
echo "Installing Docker"
echo "*****************"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

echo "************************************"
echo "Running the Docker Hello World Image"
echo "************************************"

sudo docker run hello-world
