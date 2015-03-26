# html-boilerplate
#
# VERSION               0.0.1

FROM       debian
MAINTAINER Maxime Vidori <maxime.vidori@gmail.com>

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -

RUN apt-get install -y nodejs

