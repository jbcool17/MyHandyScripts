#!/usr/bin/env ruby
#chmod +x file.rb
#Installs and setups MYSQL on Ubuntu/Mint, using apt-get

if ( !`gem list -i colorize`)
	system "gem install colorize"
end

require "colorize"

puts "----------------------------|".green
puts "This will update your system|".green
puts "-Then check for MYSQL-------|".green
puts "------Enter to Continue-----|".green
puts "----------------------------|".green
continue = gets

puts "Updating/Upgrading"
system "apt-get update"
system "apt-get -y upgrade"


#MYSQL
check_mysql = system "mysql -V"

def install_mysql
	puts "You will be promped during this part...ENTER to continue".green
	continue = gets

	puts "Installing...MYSQL".green
	system "apt-get -y install mysql-server"

	puts "Creating Databases...".green
	sleep(2)
	
	system "mysql_install_db"

	puts "Database have been created...".green
	puts "Secruity...".green
	sleep(2)

	system "mysql_secure_installation"
end

if ( check_mysql )
	puts "MYSQL is already installed".green
else
	puts "MYSQL is not installed...".red
	install_mysql
	puts "Mysql has been setup and configured".green
end

puts "THE END".blue
