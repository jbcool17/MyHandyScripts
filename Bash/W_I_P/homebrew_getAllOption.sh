
#Gets options for ffmpeg.
brew info $1 | grep "^--with-" >> $1.txt
