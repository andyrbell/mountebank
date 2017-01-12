FROM alpine:3.4

MAINTAINER Andy Bell "andyrbell@gmail.com"

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=4.6.0-r0

RUN apk update \
 && apk add --no-cache nodejs-lts=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=1.8.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean \
 && rm -rf /tmp/npm*
