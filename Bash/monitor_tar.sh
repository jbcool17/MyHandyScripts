#! /bin/bash
# $ sh script tar_location

while true; do 
	echo "status:  "; 
	ps aux | grep "tar "; 
	echo $(du -sh $1); 
	sleep 5; 
	clear; 
done
