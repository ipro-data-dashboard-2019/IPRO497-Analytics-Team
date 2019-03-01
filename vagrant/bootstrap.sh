#!/usr/bin/env bash

# Install MongoDB

## Import GPG key 
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

## Create list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

sudo apt-get update
sudo apt-get install -y mongodb-org

## Enable MongoDB service and run
sudo systemctl enable mongod.service
sudo service mongod start

# Fetch Repo
chmod 600 /home/vagrant/.ssh/id_rsa
ssh-keyscan github.com >> /home/vagrant/.ssh/known_hosts
chown vagrant /home/vagrant/.ssh/known_hosts

# Copy repo and launch app
su -c 'cd /home/vagrant; git clone git@github.com:ddelgad5/IPRO497-Analytics-Team.git' - vagrant
cd /home/vagrant/IPRO497-Analytics-Team.git/coding/twitter-fire-scraper/
