#!/bin/bash

# don't modify external host file
cp -v /{etc,tmp}/peervpn.conf

# generate static ip
static_ip="10.10.$((RANDOM%250)).$((RANDOM%250))"
echo "ifconfig4 ${static_ip}/16" >> /tmp/peervpn.conf
ifconfig peervpn0 ${static_ip}/16 # FUCK DOCKER

# launch peervpn
peervpn /tmp/peervpn.conf
