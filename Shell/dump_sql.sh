#!/usr/bin/env bash
# Import multple SQL files
# Place in folder and run.
# USAGE: sh script.sh user pass dbname
# chmod +x
echo 'Dumping Database...'
username=$1
password=$2
dbname=$3
file=$4

mysqldump -u $username -p$password $dbname > $file

echo 'Script is Finished'
