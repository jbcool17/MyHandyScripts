#!/bin/bash
# Setup 02 for a virtual machine
# Rails / Nginx

# RUBY SETUP -- NOTE SEPERATE THIS - ^*(*&^%^&*&^%$) - rvm seperate install
	# rvm

gpg --keyserver hkp://keys.gnupg.net --homedir /root/.gnupg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -L https://get.rvm.io | bash -s stable

echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
#echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc

source ~/.bashrc

echo "INSTALLING RUBY"
	# install ruby version
rvm install ruby-1.9.3-p448
# Download - wget https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.bz2

	# Set default
rvm use ruby-1.9.3-p448 --default
ruby -v

	# No docuemtation
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
	# Install bundler
gem install bundler --no-ri --no-rdoc