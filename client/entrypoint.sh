#!/bin/bash
cp /{etc,tmp}/peervpn.conf

# generate static ip (for worse case)
static_ip="10.10.1.$((RANDOM % 251))"

# dhcp client
echo "ifconfig4 ${static_ip}/23" >> /tmp/peervpn.conf
# WARNING: this timeout command is stupid; future OS versions deprecated
#          the dash -t and this will throw an error. Busybox 1.29 -> 1.30
#          breaks this
echo "upcmd timeout -t 25 udhcpc -i peervpn0" >> /tmp/peervpn.conf

# set temp. static ip if cdhcp fails
set_static() {
    sleep 30

    # ip address found!
    ifconfig peervpn0 | grep "inet " && return

    # not found, so we overwrite it
    ifconfig peervpn0 "${static_ip}" netmask 255.255.254.0
}
set_static &

# launch peervpn
peervpn /tmp/peervpn.conf
