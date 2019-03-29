#!/bin/bash
cp /{etc,tmp}/peervpn.conf

# generate static ip (for worst case if dhcp fails)
static_ip="10.10.1.$((RANDOM % 251))"
#echo "ifconfig4 ${static_ip}/23" >> /tmp/peervpn.conf

# dhcp client and route modification
echo "upcmd bash /upcmd.sh &" >> /tmp/peervpn.conf

# set static ip on dhcp failure
set_static() {
    sleep 30
    if ! ifconfig peervpn0 | grep "inet "; then
        ifconfig peervpn0 $static_ip netmask 255.255.254.0
    fi
}
set_static &

# launch peervpn
peervpn /tmp/peervpn.conf
