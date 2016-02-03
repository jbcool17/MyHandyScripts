for folder in ./*; do
	cd $folder
	for file in *.txt; do
		echo $file;
	done;
	cd ../
done; 


find ./ -name '*.wav' -exec bash -c 'ffmpeg -i $0 \
-ab 192k ${0/wav/mp3}' {} \;