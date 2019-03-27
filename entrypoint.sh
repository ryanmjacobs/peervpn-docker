#!/bin/bash

# create tun device
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
iptables -t nat -A POSTROUTING -s 10.250.0.0/24 -o eth0 -j MASQUERADE

# launch the vpn
exec /usr/sbin/peervpn /etc/peervpn.conf
