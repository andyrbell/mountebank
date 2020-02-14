FROM alpine:3.11

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=12.15.0-r1

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION} npm=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=2.2.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean --force 2>/dev/null \
 && rm -rf /tmp/npm*
