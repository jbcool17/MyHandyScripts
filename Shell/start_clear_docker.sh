#!/usr/bin/env bash
# starts up docker container / clears logs / starts monitoring

# start container
docker start $1

# Clear Logs
rm $(docker inspect $1 | grep -G '"LogPath": "*"' | sed -e 's/.*"LogPath": "//g' | sed -e 's/",//g');

# Start logs
docker logs -f $1
