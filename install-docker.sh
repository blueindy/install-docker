#!/bin/bash

#--------------------------
# Program   : Install-Docker.sh
# Objective : Install docker on Linux by script
# Date      : 27/04/2023
#--------------------------


echo "--- Checking Installed Docker ---"

# Check if Docker is already installed
if command -v docker &> /dev/null
then
    echo "...Docker is already installed on this system. Exiting..."
    exit
fi

echo "--- Docker Installing ---"

# Update the package index
sudo apt-get update

# Install the necessary packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Add the official GPG key of Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable repository for Docker
echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again
sudo apt-get update

# Install the latest version of Docker and Docker Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

# Verify that Docker is installed and running
sudo docker run hello-world
