# html-boilerplate
#
# VERSION               0.0.1

FROM       debian
MAINTAINER Maxime Vidori <maxime.vidori@gmail.com>


ENV HTML5_BOILERPLATE_URL="http://www.initializr.com/builder?"\
"h5bp-content&html5shiv&h5bp-favicon&h5bp-404&h5bp-css&h5bp-csshelpers&"\
"h5bp-mediaqueryprint&h5bp-mediaqueries&simplehtmltag&izr-emptyscript"

ENV GULPFILE="https://raw.githubusercontent.com/IxDay/"\
"docker-html5-boilerplate/master/gulpfile.js"

ENV PACKAGE="https://raw.githubusercontent.com/IxDay/"\
"docker-html5-boilerplate/master/package.json"

ENV WORKDIR /tmp/

WORKDIR $WORKDIR

ADD $PACKAGE $GULPFILE $WORKDIR

RUN apt-get update
RUN apt-get install -y curl unzip
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs
RUN npm install --global gulp
RUN npm install

RUN TMPFILE=$(tempfile) && \
    curl -s -o "$TMPFILE" "$HTML5_BOILERPLATE_URL" && \
    unzip -d /tmp "$TMPFILE" && \
    rm "$TMPFILE"

EXPOSE 8000 35729

