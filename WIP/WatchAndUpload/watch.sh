#!/bin/bash
# This script uses FFMPEG


# !!!Execute when COMPLETE FILE is in folder


watch_folder="~/Desktop/MusicUpload"


echo 'file added...'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo 'converting file...'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

# For .wav files - convert to 192k mp3
# Use 
find ~/Desktop/MusicUpload -name '*.wav' -exec bash -c 'ffmpeg -i $0 -ab 192k ${0/wav/mp3}' {} \;


echo 'file(s) converted'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

echo 'removing wav...'
#find ~/Desktop/MusicUpload -name '*.wav' -exec bash -c 'rm $0' {} \;

# Upload file to the internets
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo 'done'