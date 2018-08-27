FROM alpine:3.8

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=8.11.4-r0

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION} \
 && apk add --no-cache npm=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=1.15.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean --force 2>/dev/null \
 && rm -rf /tmp/npm*
