#image magick
sudo apt-get install -y libmagickwand-dev imagemagick libmagickcore-dev

# ruby version manager  https://rvm.io/rvm/install
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash   
#this guy will fail if your ppa repo's are 404'ing.. find out what they are 'sudo apt-get update' and get rid of them  http://askubuntu.com/questions/307/how-can-ppas-be-removed

echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc

#allow rvm to run from this script
source $HOME/.rvm/scripts/rvm

#job advisor using ruby-1.9.3-p429
rvm install 1.9.3-p448
rvm use 1.9.3-p448 --default

#mongo  http://docs.mongodb.org/v2.6/tutorial/install-mongodb-on-ubuntu/
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org=2.6.9 mongodb-org-server=2.6.9 mongodb-org-shell=2.6.9 mongodb-org-mongos=2.6.9 mongodb-org-tools=2.6.9
#pin version
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

gem install bundler --no-ri --no-rdoc

# Install Phusion's PGP key to verify packages
gpg --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
gpg --armor --export 561F9B9CAC40B2F7 | sudo apt-key add -

# Add HTTPS support to APT
sudo apt-get install -y apt-transport-https

# nokogiri req's
sudo apt-get install -y libxslt-dev libxml2-dev


# passenger
sudo apt-get install -y libcurl4-openssl-dev ruby-dev 

# Install passenger PGP key and add HTTPS support for APT
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates

# Add passenger APT repository
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update

# Install Passenger + Nginx
sudo apt-get install -y nginx-extras passenger