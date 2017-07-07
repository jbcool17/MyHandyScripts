#!/usr/bin/env bash
# Import multple SQL files
# Place in folder and run.
# USAGE: ./script.sh user pass dbname
# chmod +x
echo 'Restoring Database...'
username=$1
password=$2
dbname=$3
file=$4

mysql -u $username -p$password $dbname < $file

echo 'Script is Finished'
