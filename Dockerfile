FROM alpine:3.5

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=6.11.5

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=1.13.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean \
 && rm -rf /tmp/npm*
