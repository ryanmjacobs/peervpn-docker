# build: docker build -t ryanmjacobs/peervpn .
# run: docker run --cap-add NET_ADMIN -it ryanmjacobs/peervpn

from alpine:3.9
RUN apk add --no-cache peervpn -X http://nl.alpinelinux.org/alpine/edge/testing
RUN apk update && apk add bash iptables dnsmasq

COPY peervpn.conf  /etc/peervpn.conf
COPY entrypoint.sh /

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
