from alpine:3.9
RUN apk add --no-cache peervpn -X http://nl.alpinelinux.org/alpine/edge/testing
RUN apk update && apk add bash iptables dhclient coreutils

COPY peervpn.conf  /etc/peervpn.conf
COPY entrypoint.sh /
COPY upcmd.sh /

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
