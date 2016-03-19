#!/bin/bash
# Setup 03 for a virtual machine or server config
# Rails / Nginx

# MONGO - http://docs.mongodb.org/v2.6/tutorial/install-mongodb-on-ubuntu/ | https://docs.mongodb.org/v3.0/tutorial/install-mongodb-on-ubuntu/
	
	# Get key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 # might need sudo

	# Create the /etc/apt/sources.list.d/mongodb.list list file using the following command
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
	
	# Update Repos
apt-get update

	# Install Mongo
apt-get install -y mongodb-org=2.6.9 mongodb-org-server=2.6.9 mongodb-org-shell=2.6.9 mongodb-org-mongos=2.6.9 mongodb-org-tools=2.6.9

	# prevent upgrade
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
	
	# Starts Mongo
sudo service mongod start

