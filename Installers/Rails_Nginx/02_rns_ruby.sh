#!/bin/bash
# Setup 02 for a virtual machine or server config
# Rails / Nginx

#========================!
# !Run these commands individually, copy and paste. DONT run as script!
#========================

# RUBY SETUP - https://rvm.io/

	# Generate Keys for validation
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	# Get and Install RVM
curl -L https://get.rvm.io | bash -s stable

	# Setup Bash File
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
#echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
	#Reloads Terminal
source ~/.bashrc

	# install ruby version
rvm install ruby-1.9.3-p448 # Download - wget https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.bz2

	# Set default ruby
rvm use ruby-1.9.3-p448 --default

	# No docuemtation setting
#echo "gem: --no-ri --no-rdoc" > ~/.gemrc
	
	# Install bundler
gem install bundler --no-ri --no-rdoc