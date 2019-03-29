from alpine:3.9
RUN apk add --no-cache peervpn -X http://nl.alpinelinux.org/alpine/edge/testing
RUN apk update && apk add bash
COPY entrypoint.sh /

# when running docker, use -v $PWD/peervpn.conf:/etc/peervpn.conf
CMD touch /etc/peervpn.conf

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
