#!/bin/sh

# Install Docker

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

apt-cache policy docker-ce

sudo apt-get install -y docker-ce

# Install Docker Compose

sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

# Install git

apt-get update

apt-get install git-core

git config --global user.name "testuser"

git config --global user.email "testuser@example.com"

cd /bin/

sudo git clone https://github.com/iota-community/one-command-tangle.git
sudo git clone --branch simulation-w/o-walletqueue https://github.com/iotaledger/industry-marketplace.git

sudo scp -r one-command-tangle/. industry-marketplace/ServiceApp/server/
cd industry-marketplace/ServiceApp/server/


# Start environment
sudo docker-compose -f docker-compose.yml -f docker-compose-sim-setup.yml -f docker-compose-tools.yml up


