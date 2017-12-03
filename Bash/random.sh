
# Find all directories in current location and run script
find . -type d -mindepth 1 -maxdepth 1 -exec ./compress-it {} \;
