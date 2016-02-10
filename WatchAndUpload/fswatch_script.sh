#!/bin/bash
# Use full path 
# make sure script is executable - chmod +x watch.sh

fswatch -o ~/Folder/to/Watch/ | xargs -n1 ~/Script_to_Run/watch.sh
