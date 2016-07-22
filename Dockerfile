FROM alpine:3.4

MAINTAINER Andy Bell "andyrbell@gmail.com"

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=4.4.4-r0

RUN apk update \
 && apk add --no-cache nodejs-lts=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=1.6.0-beta.1107

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean \
 && rm -rf /tmp/npm*
