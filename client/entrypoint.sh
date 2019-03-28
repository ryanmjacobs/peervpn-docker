#!/bin/bash

# dhcp client
echo "upcmd udhcpc -i peervpn0" >> /etc/peervpn.conf

# set temp. static ip if cdhcp fails
set_static() {
    sleep 30

    # ip address found!
    ifconfig peervpn0 grep "inet " && return

    static_ip="10.10.1.$((RANDOM % 251))/23"
    ifconfig peervpn0 "$static_ip" netmask 255.255.254.0
}
set_static &

# launch peervpn
peervpn /etc/peervpn.conf
