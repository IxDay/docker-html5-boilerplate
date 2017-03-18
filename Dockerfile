# html-boilerplate
#
# VERSION               0.0.2

FROM       alpine:3.4
MAINTAINER Maxime Vidori <maxime.vidori@gmail.com>

RUN apk --update add nodejs
RUN npm install gulp gulp-connect

ENV HTML5_BOILERPLATE_URL "http://www.initializr.com/builder?"\
"h5bp-content&html5shiv&h5bp-favicon&h5bp-404&h5bp-css&h5bp-csshelpers&"\
"h5bp-mediaqueryprint&h5bp-mediaqueries&simplehtmltag&izr-emptyscript"

RUN apk --update add -t build-dependencies wget libarchive-tools \
    && wget -O - "$HTML5_BOILERPLATE_URL" | bsdtar -xvf- \
	&& apk del build-dependencies \
	&& rm -rf /var/cache/apk/*

ADD gulpfile.js .

EXPOSE 8000 35729
ENTRYPOINT ["node_modules/gulp/bin/gulp.js"]
CMD ["serve"]
