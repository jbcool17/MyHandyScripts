#!/usr/bin/env bash
# Get Projects Info & Fetch Latest
# USAGE: sh script.sh <folder_path>
# chmod +x

folder_path=$1

if [ -z "$folder_path ]
then
	echo "please provide a folder path"
	echo "script <folder_path>
	exit
fi

for folder in $1/* ; do 
	
	
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
		if [ -d $folder/".git" ]; then

			cd "$folder"
  			echo "Fetching for repo: "
			basename `git rev-parse --show-toplevel`
			echo "Location: $folder"
			git fetch

		else
			echo "Skipping - No Git Repo Found @ $folder"
		fi
done

echo ''
echo 'DONE!'
echo ''
