#!/bin/bash
# Setup 01 for a virtual machine or server config
# run with sudo 
# Rails / Nginx

#Setup Dev Env
	# w/ req's, nokogiri / passenger / imagemagick etc...
	# And other builds essential to current project

	# UPDATE REPOS
apt-get update

	# INSTALL
apt-get install -y git curl zlib1g-dev build-essential \
libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
libxml2-dev libxslt-dev libcurl4-openssl-dev \
python-software-properties libffi-dev ruby-dev \
libmagickwand-dev imagemagick libmagickcore-dev \
libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
	
