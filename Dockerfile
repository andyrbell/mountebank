FROM alpine:3.6

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=6.10.3-r1

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION} \
 && apk add --no-cache nodejs-npm=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=1.13.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean \
 && rm -rf /tmp/npm*
