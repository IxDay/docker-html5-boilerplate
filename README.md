# Simple html5 boilerplate through Docker

This simple container allows you to quickly set up a static webpage and 
serve it. 

## How To

* build the image 
`docker build -t html5-boilerplate github.com/IxDay/docker-html5-boilerplate`
* [optionnal] initialize the current directory with a simple html boilerplate
`docker -v $(pwd):/mnt html5-boilerplate init`
* serve the current directory though a webserver with livereload
`docker -v $(pwd):/mnt html5-boilerplate`

