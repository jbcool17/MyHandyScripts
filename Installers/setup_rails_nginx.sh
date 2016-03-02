#Setup Dev Env
apt-get update
apt-get install -y git-core curl zlib1g-dev build-essential \
libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
libxml2-dev libxslt1-dev libcurl4-openssl-dev \
python-software-properties libffi-dev


#RUBY SETUP
apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -L https://get.rvm.io | bash -s stable

source /home/vagrant/.rvm/scripts/rvm

# check
rvm install ruby-1.9.3p448


#wget https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.bz2

rvm use ruby-1.9.3-p448 --default
ruby -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

#NGINX
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates

# Add Passenger APT repository
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update

# Install Passenger & Nginx
sudo apt-get install -y nginx-extras passenger

#TEST NGINX
#mkdir sites
#cd sites
#mkdir test
#cd test
#echo "HELLO WORLD" >> index.html

#vim /etc/hosts
#echo '127.0.0.1 test.local' >> hosts
#cp -pvr default test.local
#vim test.local
# root, server name, remove defaults
#ln -s /etc/nginx/sites-available/test.local /etc/nginx/sites-enabled/

#sudo service nginx restart

#MONGO - https://docs.mongodb.org/v3.0/tutorial/install-mongodb-on-ubuntu/
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
apt-get install -y mongodb-org
#prevent upgrade
#echo "mongodb-org hold" | sudo dpkg --set-selections
#echo "mongodb-org-server hold" | sudo dpkg --set-selections
#echo "mongodb-org-shell hold" | sudo dpkg --set-selections
#echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
#echo "mongodb-org-tools hold" | sudo dpkg --set-selections

service mongod start

#create ssh key: add pub key source to destination auth keys

#NODE for js support
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs