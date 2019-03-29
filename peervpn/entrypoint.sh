#!/bin/bash

# don't modify external host file
cp -v /{etc,tmp}/peervpn.conf

# generate static ip
static_ip="10.10.$((RANDOM%250 + 1)).$((RANDOM%250 + 1))"
echo "RANDOM IP ----> $static_ip"
echo "ifconfig4 ${static_ip}/16" >> /tmp/peervpn.conf

set_ip() {
    while ! ifconfig | grep peervpn0; do
        sleep 1
    done
    sleep 1
    ifconfig peervpn0 ${static_ip} netmask 255.255.0.0 # FUCK DOCKER
}
set_ip &

# launch peervpn
peervpn /tmp/peervpn.conf
