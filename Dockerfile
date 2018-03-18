FROM alpine:3.7

EXPOSE 2525

CMD ["mb", "--pidfile", "/tmp/mb.pid", "--logfile", "/tmp/mb.log"]

ENV NODE_VERSION=8.9.3-r0

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=1.14.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean --force 2>/dev/null \
 && rm -rf /tmp/npm*

USER 1001
