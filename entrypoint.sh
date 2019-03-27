#!/bin/bash

# finish config with random ipv4 address
cp /etc/peervpn.conf /tmp
echo "ifconfig4 10.10.$((RANDOM%256)).$((RANDOM%256))/16" >> /tmp/peervpn.conf
cat /tmp/peervpn.conf

# create tun device
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
iptables -t nat -A POSTROUTING -s 10.250.0.0/24 -o eth0 -j MASQUERADE

# launch the vpn
exec /usr/sbin/peervpn /tmp/peervpn.conf
