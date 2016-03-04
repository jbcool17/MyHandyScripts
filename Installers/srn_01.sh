#!/bin/bash
# Setup 01 for a virtual machine
# Rails / Nginx

#Setup Dev Env
	# w/ nokogiri req's, passenger
apt-get update
apt-get install -y git curl zlib1g-dev build-essential \
libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
libxml2-dev libxslt-dev libcurl4-openssl-dev \
python-software-properties libffi-dev ruby-dev

	#image magick - look up correct im setup
apt-get install -y libmagickwand-dev imagemagick libmagickcore-dev

apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev