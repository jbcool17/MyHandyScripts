#!/usr/bin/env bash
# Import multple SQL files
# Place in folder and run.
# USAGE: sh script.sh user pass dbname
# chmod +x

username=$1
password=$2
dbname=$3

for file in *.sql; do mysql -u $username -p$password $dbname < $file; done

echo 'Script is Finished'
