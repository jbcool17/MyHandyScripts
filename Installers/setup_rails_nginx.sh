#!/bin/bash
# Setup for a virtual machine
# Rails / Nginx

#Setup Dev Env
	# w/ nokogiri req's, passenger
apt-get update
apt-get install -y git curl zlib1g-dev build-essential \
libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
libxml2-dev libxslt-dev libcurl4-openssl-dev \
python-software-properties libffi-dev ruby-dev

	#image magick
apt-get install -y libmagickwand-dev imagemagick libmagickcore-dev

#===========================================
#===========================================
#===========================================
# RUBY SETUP -- NOTE SEPERATE THIS - ^*(*&^%^&*&^%$) - rvm seperate install
	# rvm
# apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
# gpg --keyserver hkp://keys.gnupg.net --homedir /root/.gnupg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# curl -L https://get.rvm.io | bash -s stable
# echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
# echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
# source ~/.bashrc

# echo "INSTALLING RUBY"
# 	# install ruby version
# rvm install ruby-1.9.3-p448
# # Download - wget https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.bz2

# 	# Set default
# rvm use ruby-1.9.3-p448 --default
# ruby -v

# 	# No docuemtation
# echo "gem: --no-ri --no-rdoc" > ~/.gemrc
# 	# Install bundler
# gem install bundler --no-ri --no-rdoc

#===========================================
#===========================================
#===========================================

#MONGO - http://docs.mongodb.org/v2.6/tutorial/install-mongodb-on-ubuntu/ | https://docs.mongodb.org/v3.0/tutorial/install-mongodb-on-ubuntu/
	#Mongo
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list
apt-get update
apt-get install -y mongodb-org
	#Mongo 2.6.9
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
apt-get update
apt-get install -y mongodb-org=2.6.9 mongodb-org-server=2.6.9 mongodb-org-shell=2.6.9 mongodb-org-mongos=2.6.9 mongodb-org-tools=2.6.9

#prevent upgrade
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

# Starts Mongo
service mongod start

#NGINX
	# Install Phusion's PGP key to verify packages
gpg --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
gpg --armor --export 561F9B9CAC40B2F7 | sudo apt-key add -
	
	# Add Passenger APT repository / HTTPS support
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
apt-get install -y apt-transport-https ca-certificates

sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'
apt-get update

	# Install Passenger & Nginx
apt-get install -y nginx-extras passenger

#TEST NGINX
#mkdir sites && cd sites && mkdir test && cd test
#echo "HELLO WORLD" >> index.html

#vim /etc/hosts
#echo '127.0.0.1 test.local' >> hosts
#cp -pvr default test.local
#vim test.local
# root, server name, remove defaults
#ln -s /etc/nginx/sites-available/test.local /etc/nginx/sites-enabled/

#sudo service nginx restart

#create ssh key: add pub key source to destination auth keys

#NODE for js support
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs
