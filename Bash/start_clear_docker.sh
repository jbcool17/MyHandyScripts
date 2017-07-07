#!/usr/bin/env bash
# starts up docker container / clears logs / starts monitoring
# may need sudo

# Clear Logs
rm $(docker inspect $1 | grep -G '"LogPath": "*"' | sed -e 's/.*"LogPath": "//g' | sed -e 's/",//g');

# start container
docker start $1

# Start logs
docker logs -f $1
