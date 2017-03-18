# Simple html5 boilerplate through Docker

This simple container allows you to quickly set up a static webpage and
serve it.

## How To

* install docker ([link here](https://docs.docker.com/installation/))

* build the image
`docker build -t html5 github.com/IxDay/docker-html5-boilerplate`

* [optionnal] initialize the current directory with a simple html boilerplate:

`docker run --rm --volume $(pwd):/mnt --user $(id -u):$(id -g) html5 init`

* serve the current directory though a webserver with livereload:

`docker run --rm --volume $(pwd):/mnt --user $(id -u):$(id -g) html5`

* get the ip of the docker container:

`docker inspect -f '{{.NetworkSettings.IPAddress}}'  $(docker ps | awk '$2 ~ /html5/ { print $1 }')`

* access the ip on the port 8000 through you browser, then enjoy livereload!
