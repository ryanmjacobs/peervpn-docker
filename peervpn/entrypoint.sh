#!/bin/bash

# don't modify external host file
cp -v /{etc,tmp}/peervpn.conf

# generate static ip
static_ip="10.01.$((RANDOM%250)).$((RANDOM%250))"
echo "ifconfig4 ${static_ip}/16" >> /tmp/peervpn.conf

# modify hostname (external host can mount /etc/hostname to use this feature)
hn=$(tr . - <<< $ip)
echo $hn > /etc/hostname
hostname $hn

# launch peervpn
peervpn /tmp/peervpn.conf
