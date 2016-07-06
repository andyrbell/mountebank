FROM alpine:3.4

MAINTAINER Andy Bell "andyrbell@gmail.com"

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=6.2.0-r0

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=1.5.1-beta.1115

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm config set registry http://registry.npmjs.com
 && npm cache clean \
 && rm -rf /tmp/npm*
