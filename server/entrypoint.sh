#!/bin/bash

cp /{etc,tmp}/peervpn.conf

# dhcp server node uses a static ip
echo "ifconfig4 10.10.0.1/23" >> /tmp/peervpn.conf
echo "upcmd dnsmasq -i peervpn0 --dhcp-range=10.10.0.10,10.10.0.250,255.255.255.0,12h" >> /tmp/peervpn.conf

# launch peervpn
peervpn /tmp/peervpn.conf
