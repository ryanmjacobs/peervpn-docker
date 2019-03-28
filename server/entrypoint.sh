#!/bin/bash

# dhcp server node uses a static ip
echo "ifconfig4 10.10.0.1/23" >> /etc/peervpn.conf
echo "upcmd dnsmasq -i peervpn0 --dhcp-range=10.10.0.10,10.10.0.250,255.255.255.0,12h" >> /etc/peervpn.conf

# launch peervpn
peervpn /etc/peervpn.conf
