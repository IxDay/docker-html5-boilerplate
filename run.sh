#!/bin/bash
set -e

CONTAINER_NAME="html5-boilerplate"

# Echo the command prefixed with '++' than run it
echo_and_run () {
    echo ++ "$@"
    eval "$@" 
}

# Check if the image exists in docker, otherwise run it
if ! docker images | grep -q "$CONTAINER_NAME"
then
    echo_and_run \
    docker build -t "$CONTAINER_NAME" github.com/IxDay/docker-html5-boilerplate
fi

# Initialize the directory if empty
[ "$(ls -A .)" ] || echo_and_run docker -v $(pwd):/mnt "$CONTAINER_NAME" init

# Checks if a container with the same name is not already running
HTML_CONTAINER=$(docker ps | awk '$2 ~ /'"$CONTAINER_NAME"'/ { print $1 }')

if [ ! -z $HTML_CONTAINER ]
then
    echo "The container is already running, its id is $HTML_CONTAINER"
    while true
    do
        echo "kill it? [y/N]"
        read KILL
        [ -z $KILL ] && exit
        [ "$KILL" = "y" ] && break
    done
    echo_and_run docker kill $HTML_CONTAINER
fi

# Run the container and serve pwd directly with livereload
echo_and_run docker -v $(pwd):/mnt html5-boilerplate

