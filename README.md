# Simple html5 boilerplate through Docker

This simple container allows you to quickly set up a static webpage and 
serve it. 

## Getting started

Just run the following command:
`bash <(curl -fsSL https://raw.githubusercontent.com/IxDay/
docker-html5-boilerplate/master/run.sh)`

## How To

The [run.sh](./run.sh) script launch the following commands

* install docker ([link here](https://docs.docker.com/installation/))

* build the image 
`docker build -t html5-boilerplate github.com/IxDay/docker-html5-boilerplate`

* [optionnal] initialize the current directory with a simple html boilerplate
`docker -v $(pwd):/mnt html5-boilerplate init`

* serve the current directory though a webserver with livereload
`docker -v $(pwd):/mnt html5-boilerplate`

* get the ip of the docker container
`docker inspect $(docker ps | awk '$2 ~ /html5-boilerplate/ { print $1 }')`,
the ip is visible in `NetworkSettings` `IPAddress` section. 
If you have [jq](http://stedolan.github.io/jq/) installed, here is the complete
command to access the information
```
HTML_CONTAINER=$(docker ps | awk '$2 ~ /html5-boilerplate/ { print $1 }')
docker inspect $HTML_CONTAINER | jq '.[0].NetworkSettings.IPAddress'
```

* access the ip on the port 8000 through you browser, then enjoy livereload!

## boot2docker issue 

If you are using boot2docker the container IP will not be accessible directly.
This command will give to your computer the needed accesses:
`sudo route -n add 172.17.0.0/16 $(boot2docker ip)`

