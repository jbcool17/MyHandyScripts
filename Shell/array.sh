ARRAY=()

while read line           
do      
    ARRAY+=("{$line}")
done <ffmpegOptions.txt  


echo $ARRAY