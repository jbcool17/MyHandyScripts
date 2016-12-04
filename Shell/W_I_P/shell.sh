for folder in ~/Projects/* ; do 
	cd "$folder"
	basename `git rev-parse --show-toplevel`
	
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
	echo "Fetching for repo: "
	basename `git rev-parse --show-toplevel`
	echo "Location: $folder"
	#git fetch
echo "RUNNING COMMAND"

done

