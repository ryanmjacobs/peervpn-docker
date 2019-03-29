from alpine:3.9
RUN apk update && apk add bash iptables dnsmasq
ENTRYPOINT ["/usr/bin/dnsmasq", "-i", "peervpn0", "--dhcp-range=10.10.0.10,10.10.0.250,255.255.254.0,12h"]
