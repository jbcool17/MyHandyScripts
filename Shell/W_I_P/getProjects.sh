#!/usr/bin/env bash
# Get Projects Info & Fetch Latest
# USAGE: sh script.sh FOLDER_PATH
# chmod +x

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
