FROM alpine

RUN set -euvxo pipefail \
 && adduser -D -u 3000 user \
 && apk add --no-cache xeyes

USER user
