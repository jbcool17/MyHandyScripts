#!/bin/bash
# Setup 04 for a virtual machine or server config
# Rails / Nginx

#NGINX
	# Install Phusion's PGP key to verify packages
gpg --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
gpg --armor --export 561F9B9CAC40B2F7 | sudo apt-key add -
	
	# Add Passenger APT repository / HTTPS support
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
apt-get install -y apt-transport-https ca-certificates

#sudo
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'
apt-get update

	# Install Passenger & Nginx
apt-get install -y nginx-extras passenger

# NODE for js support
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs

echo "----"
echo "DONE"
echo "----"
