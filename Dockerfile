FROM alpine:3.15.0

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=16.14.0-r0 NPM_VERSION=8.1.3-r0

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION} npm=${NPM_VERSION}

ENV MOUNTEBANK_VERSION=2.6.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean --force 2>/dev/null \
 && rm -rf /tmp/npm*
