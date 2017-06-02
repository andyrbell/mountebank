FROM alpine:3.5

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=6.9.5-r0

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=1.11.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean \
 && rm -rf /tmp/npm*
